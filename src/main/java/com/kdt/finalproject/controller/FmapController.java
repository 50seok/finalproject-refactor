package com.kdt.finalproject.controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kdt.finalproject.vo.ChargeVO;
import com.kdt.finalproject.vo.MemVO;

@Controller
public class FmapController {

    private String key = System.getenv().getOrDefault("CHARGING_API_KEY", "EjMxyUf8WVGI20O08ZfgO8T3SoyKc1Y60RL817rs");

    // 메인에서 위치를 받은 경우 맵에 뿌려줄 충전소api
    @RequestMapping("/fmap/")
    public ModelAndView searchCharger2(String city) throws Exception {
        System.out.println("////////////////////////////111");
        ModelAndView mv = new ModelAndView();

        if (city == null || city.trim().isEmpty()) {
            city = "서울특별시";
        }

        // 한전 빅데이터 EV충전소 API (JSON)
        // https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do
        System.out.println(city);
        String two = city.substring(0, 2);
        if (two.equals("충남") || two.equals("충북")) {
            two = "충청";
        } else if (two.equals("전남") || two.equals("전북")) {
            two = "전라";
        } else if (two.equals("경남") || two.equals("경북")) {
            two = "경상";
        }

        StringBuffer sb = new StringBuffer();
        sb.append("https://bigdata.kepco.co.kr/openapi/v1/EVcharge.do");
        sb.append("?apiKey=" + key);
        sb.append("&returnType=json");
        sb.append("&numOfRows=800");
        sb.append("&pageNo=1");
        sb.append("&addr=" + URLEncoder.encode(two, "UTF-8"));

        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Accept", "application/json");
        conn.connect();

        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode root = objectMapper.readTree(conn.getInputStream());
        JsonNode items = root.path("result");

        List<ChargeVO> chargeList = new ArrayList<>();
        if (items.isArray()) {
            for (JsonNode e : items) {
                ChargeVO vo = new ChargeVO(
                    e.path("addr").asText(""),
                    e.path("chargeTp").asText(""),
                    e.path("cpId").asText(""),
                    e.path("cpNm").asText(""),
                    e.path("cpStat").asText(""),
                    e.path("cpTp").asText(""),
                    e.path("csId").asText(""),
                    e.path("csNm").asText(""),
                    e.path("lat").asText(""),
                    e.path("longi").asText(""),
                    e.path("statUpdateDatetime").asText("")
                );
                chargeList.add(vo);
            }
        }

        ChargeVO[] ar = chargeList.toArray(new ChargeVO[0]);

        if (ar.length > 0) {
            Arrays.sort(ar, new Comparator<ChargeVO>() {
                @Override
                public int compare(ChargeVO c1, ChargeVO c2) {
                    try {
                        return Integer.compare(Integer.parseInt(c1.getCsId()), Integer.parseInt(c2.getCsId()));
                    } catch (NumberFormatException e) {
                        return c1.getCsId().compareTo(c2.getCsId());
                    }
                }
            });
        }

        for (int x = 0; x < ar.length; x++) {
            for (int y = 0; y < ar.length; y++) {
                if (ar[x].getCsId().equals(ar[y].getCsId())) {
                    if ("1".equals(ar[y].getCpStat())) {
                        ar[x].setCpStat("1");
                    } else if (!"1".equals(ar[x].getCpStat())) {
                        if ("2".equals(ar[y].getCpStat())) {
                            ar[x].setCpStat("2");
                        }
                    }
                }
            }
        }

        mv.addObject("ar", ar);
        mv.addObject("len", ar.length);
        mv.setViewName("/fmap/fmap");

        return mv;
    }

    // 목록을 클릭 했을때 길찾기 표시를 비동기식 전송방식으로 받음
    @PostMapping("/here")
    @ResponseBody
    public Map<String, Object> searchFestival2(String lati3, String lon3, String lati2, String lon2) throws Exception {
        Map<String, Object> map = new HashMap<>();
        System.out.println("/////////////////////11");
        String apiKey = System.getenv().getOrDefault("KAKAO_REST_API_KEY", "f7b7653182e4c0612dac5e8cd9ea9c19");
        StringBuffer sb = new StringBuffer();
        sb.append("https://apis-navi.kakaomobility.com/v1/directions");
        sb.append("?priority=RECOMMEND");
        sb.append("&car_type=1");
        sb.append("&car_fuel=GASOLINE");
        sb.append("&origin=" + lon3 + "%2C" + lati3); // 출발지 위도경도
        sb.append("&destination=" + lon2 + "%2C" + lati2); // 도착지 위도경도
        System.out.println("/////////////////////22");
        URL url = new URL(sb.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestProperty("Authorization", "KakaoAK " + apiKey);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.connect();
        System.out.println("/////////////////////33");
        if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
            // API 호출이 성공한 경우
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode root = objectMapper.readTree(conn.getInputStream());
            JsonNode routes = root.get("routes");

            map.put("key", routes);
        } else {
            // API 호출이 실패한 경우
            map.put("error", "API 호출 실패: " + conn.getResponseCode());
        }
        System.out.println("/////////////////////");
        return map;
    }

}
