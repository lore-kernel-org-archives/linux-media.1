Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200858;
	b=F0vC+zbFcn7xi1QPnstOmzE0eCgb04Pf6sWDsmrRn/neNDMuApQvx6N9IzIxttF/lwr9
	 FOh7DxZUGF78bG0j0klMaK14fR/2gdj+9DgcX44wFhskRKROuvWyVjbM9ZaXGd4EposZA
	 B1RA6WVdVvI9f2EA3+uCLGofI0W3sRuLXkaXiRva7j2DSy2ZZdylXY+F7vKa0dvSfQbOn
	 6HVbRwNBGu9DZK0LSDJTa5e3+CdTV3ABkhKPv4Mu8cRbfBIfg9jAQlmqu++gNYQxmUMa2
	 voOFB6oSqJ2vFhCtqECvcz5orPqH4Bx72hRkDDym5w5NgsDhdwc1im+UnfNf7DMU1lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
	b=arcQ9kB2mBpmZpLtD/LECFaHbvkmDwXFAbAFSmqugnXczJWXiU19wNNP2e7DTfMRchKq
	 7+2NCwZQOhquKM9FXIOMrTvb2/Mali/5LDIlGjldeYDf1VPFPlEQw2BSdUwvQ2ypkck0/
	 3LcQzOMi0vXjrm3hpMog5C6JUdkF2kmH9wwIrizYAWuFF/W+Iwked42MMvJ0QYbXWZDhX
	 uAPyVbCE9v0oo1pypHAlwDoFeBiBs/zw22zGtp6LaoOkI3qxezSTRY8J1Kv+VDer90FHu
	 HkxYAOedBNY9wwCjJ8IpSMD0JyADYkBiOOoOpI1Qzfko8cwLBb0SrunxzdPkXdmQAlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZrh5Nxc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC135606A335
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC135606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gaYc9k84;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iZrh5Nxc
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFB5kZ2070763
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:20:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=gaYc9k84PoLq9363
	VhsGb/OPFThRaWzzY3kdP5OVzSpQVOIm3Ang8GUVi7BBUZkHH7CUcYo01bbHs+Kc
	9KIftVFeIzwZNmVwgwXH8GXisyp+A6+9lWH80kMHHngwTD9wkt0k7YoZtRiNJiy4
	X+v9e0uyepI8RVdOQhbgeTVocIlR0Ya6iL9xvgNNsxrE6JT7x2gdpcDRELPlQIkU
	Vw/C6P54c3xea0+HhykvhPE8xBblIKDMkhiEpclRAcjFQOfWYbrZeOeDAdJ4nGYI
	6xllza0er8CNLBkq+mYdzGusuzuyz6GhcHhsddki5byGcbab4lZnecGxu7Ermz+P
	fBvaaA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jv7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:20:56 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679aa1bb496so1886308d50.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200856; x=1793805656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=iZrh5Nxcg7bjlqo9uBRMOCl5zKFFvt3Hu/6UUz866QL0MRNa3NvHjNM2WN1WYhzSAG
         /JaU3/nvyAPcq4bJ6Wlne08FdCGNB5I+a00bUDmgrK9v/+DFMoyC1OGQxlyFAwQVoMYq
         g6IlNONX1Nl2ioR7khyu8p/bu60o/MeylYEnmYKGBp82mpZjXEI62OzVTObPkRztRi8D
         hAHGqLZ0Vu/gJFR/a5vUjeXOl9SnKTyyPWDn/iEZmAh6ZUht7PJHFuO1QzYTUMIsEfkX
         21YKwysxd3288n5LNqZ/i/+MtHf9cc5pAosq1pZfl0NFjF7hsIlx79D3Izz81T0/DmWR
         F/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200856; x=1793805656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=XTCCx1OYe1CW/IiGNaPw3HwxKqfARiK9q7EyTtf2OUhhgXFio8UgZZmQGR0NJKLgeV
         g0SGDNgElg+LgTay8xcbt2xmKsqbGvYt7SKJK6iTnnwjqkASET7pj27NtN9Z2ehY43Lw
         N9RN9J8VX7SUiS8tA/451xzx3XLaQ5fRJjJVYHiEhqdPwMD0wZxaZ4gpdmlc7y8qRoqq
         lHzgfPGgaRWCzw1Jo8qdWxCB56sYvLLoqLXlV3Ns9LrAQbgXtGV5qhSbsM6SvxwHO11t
         WjYyulmalZC+NpdXH2sIfP2mqHJyWPLYhH1SaPz0Gb8b6lWTJ9u1AL9Ij9imFTU7Hj8w
         JtaA==
X-Forwarded-Encrypted: i=1; AKwUvBzQVv9vWufCczNweXKBpVfOxeV0a4JmiqGNBQaJLcsbIacGI4tsudC3mcZfPw3PDTHP32jH4S6/lW/14A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLSqOiIE0qYAAQsaia0NWh7h1E/ITaZuWMT4AWe8Qk1x6xZx4p+
	XUHz/UoxBbgUpxYwcGouXTJRTMHekHZw6Z3e8IxdelQ7wJ7BnwGSTngFsRlD5fS3duYbRaGsTzo
	lJ3FfJiWRnyBc3gwqSdggE9T5FEVSrkfNJNoozJMCRE/jSbcsBDyWKObQ2f3MOvYhRA==
X-Gm-Gg: AYBFou1LNQYKkcYKQglbJBVMA/kWVvvuhVXG1J6Bf+aluF2g9eVsylekclLNgI7EHLD
	FUrhQNO39bvtwI6QlC/hbTswmUTzERxUwlT/SLOWua7clCfTYWGMrt4m4WgSXHODg3Lt9S8wEYL
	40V+WeadT2lO3Z642bwc3yeQlejnaWUhSZmIqfhf8OL7ckY1b4Fg7oFx6QFYXWB/GDZuIuahBri
	OPc84hy8xad3yqfIwxEFLpeAZTLlAG7uL5zvmGxxGnO2Hy11QFxslMycU006gDwJIiYhrtipBJb
	tnSS2qhhLZmnLiSvaJh0ybtBouRBDidlkVdfXYCuDRNagQH8RghuOtg1hsqSCFowJ5kD44h5R0O
	40jUwc6t4aDP0maxaTVdUEeHn29NGnMvZuo4bldsaHGg440hHH58aL5vlMILy9v+oXxqXKhRLDY
	FsT/zjiPdOcaT0N746IyMhvAGnalLpYZRw1Kld7FN2DBpZ2xqth43euTjgo99G
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474809d50.39.1793200855480;
        Wed, 28 Oct 2026 08:20:55 -0700 (PDT)
X-Received: by 2002:a05:690e:4548:10b0:677:b6f0:63c0 with SMTP id 956f58d0204a3-67a7bc5eab4mr1474784d50.39.1793200854685;
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:54 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:35 -0700
Subject: [PATCH v23 01/15] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261028-kaanapali-camss-v23-1-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXyB7xAHTz6O4W
 OkxY1uMb6gIsyg4K5R390IrX5et7qu2PyXhGrMqK6GzU7jUb0e6O0f2NrZFc4/IvxbiVH1ojwW+
 Oo5VsuM0zdaIIJpkxkSJov2GX9Zb+TI=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae212d9 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9_5F23QrTVRvoequu-hrbPcM5NYHTXF9
X-Proofpoint-ORIG-GUID: 9_5F23QrTVRvoequu-hrbPcM5NYHTXF9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX2xqRVQNO8lxo
 8jTvuNZ31oD513qg60FM9D3gfPAOPnIz1RZtmsfaP1N7cfT2v1r650zcEaepThBOhOTytG8/N8G
 +/MM2sAy2O8Gh7uM0iazQkMUSiKkyx4qnkY8kyZmbl8fr0eNGJN/kjvgZQOd/VSn0iEjvcHBayv
 5olHn72jZLeQjcNCau/NxVvuBmkp3oQvC/dfQoqa5uR5u2rBhL8CFTnBrxDzeCu5i5nOyH1l4HS
 vHmrorPRaJix9dB2uQOtPGio3FTi6FrLIFkOcQTeltUz6MCj2ZhhG6MQlnGBvn3De4txaFNQjBF
 1wRMRPRI60W7Dft9GrHVFhl6yQtqMF8yhskcyeYSgjmYTKdrBxKa2C/ol3B33x43DxKVt98o5uu
 qnh0npwEDeluAtXIoXoHfd/QiossYAm/aoZExYaeZ1iULm0NpWvclFrCweV2g4koFfTew9LDPLv
 ZTduMd8XYYecHmslM+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

