Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655794;
	b=3cdX4cOinJ3HIB+tSraE/aTldKui76UUADPNHiLi2wnYW8W1C3t+SCFxnziKL79LaTCn
	 JFwiDq6cWqdErx97GvrpvcO23K7RNztMg3MkPDDkkUrHI45jhf+IOQbrwqf4nrwsKBHBy
	 Vv6lu0yKpTPbJBvhJomtAdG7ZLG8jCOpQ0lfm2T8qf+QxtLA4StZL/oStSVtNyIld7dT4
	 k5/eYz5XI0LpgvCm6gEvy1fax4twTALL03eiSSWLiFZQn9WJSsdQj1bhauwg5Ixn8AF6x
	 /YkTQK94puHIgnwT/hx3ZmSI01AQIRawTzDzR3FDz56tSe74j3bRHEnwbigRUjNU9tA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655794;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
	b=dFqz4K9IeOUQFK/KjLYeYLqEVFX3ZHraBAFjrViiXiMHXrsehxAvjTcMs4UkAZ+qspU1
	 jfm7MUZWX1o2F5kJFd+h91leMERLZtWg9MZ8afsjK7xxd5rYgqbm/xcBOW1cgFKrgHiWk
	 pdWUEgS/Y6KJH3bcZEYPtvoDOTMFCsPoKSuu6wyMDWsi9+il+Ho2Q35QBtVsPAxsB2XJn
	 FX/zXZWMlvJJpM02WDepffcnlITwa0YJ5YwKdtwSYF2whrtncjhA78GDbWHZH7dREvni+
	 fQa0KDCsWk80ogM8ox7alkE7qJuBPK7wG0fExqFKtX67nqdfPMjuxEDMXXNBvVq5zuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTw5mjsl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572AE606A339
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:29:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 572AE606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKQUzFz4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bTw5mjsl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wIF43650138
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=; b=eKQUzFz43741krLN
	/oALLtSYyXkq0AcsL/w4XtHfQeZ5csEulv5/mfpFFrY/JJKvqe89fx/f2KSIy+eJ
	dISWagwXVvYwdrmxEgJKlLjP4BRroC9WQU8rXEIBjFB5NVm6p3jYJZAgQzT1jh6y
	y6yNldtHt2cU5ks8MQhQz+iABPoDl+LWmxBTIGkK/+vVPo6tUsfWgQrH7L9kBvBC
	BbZxkXQAC59IKutjCFhj5Hmv0W7oNolY7E95TBTBcGfEOsXLrNls59VgOLQL7RGE
	nAX9B58UXLgmi4qZwcku7szYxEiS0Lp3LGNCnoLEyS7Shlos+vN785DJchulAnly
	gwrJFg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhjrn8a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:29:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-54af6c38092so20273611cf.0
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655793; x=1795260593; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=bTw5mjsl2XeBSnAS/SP8plkBB0HwhuPDpySTU9WUepI10qEYFfjN8fAUhRev7vvGIr
         pW4ewrNwYbvXA3gvIApABSuJuf5UoBYPtfFqRDFRi1CoYje7qp5TZzaOs+7zMDBbmXBM
         RUkAricVyd3Gs+XBAD3wdcOTnqL9sq1QUQOQsul+51BFtUV2376O0bSDl/7dyr9v2ckm
         5MByhdwVK9BEnCyqrsPUZsl+JZCRrwSbq551FgLYZWtUl9+fBe+AHHHHIUhYcgb+N9QB
         TN9Bzy1SjQbZgpmghBxhaat4ard3e2rRpB7ZIROMy1tvSLrz/dArSiCRqPwk8ATyFd+E
         WHTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655793; x=1795260593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pTyV354OgCgsC+UdeFF5DsnhBflmhvuYXStEItKr1io=;
        b=mG05n2UZaG48p7w07Gbj6IJ3Yvp1Th5m1y9+zVO924+IAwbXYwn1OKI1vPthjRrk+Q
         IKI2f3hsMr3nqSBYGVBwpUxouqftU6lIPlkizbIjXae0UO8fiRanLKX/vvG3AuAdz6Bp
         cvg3IdJmVCAvE+zZCsv4evrq8QUOVQ72mLGnS4xbNiJ8PVKFgRfIFzGPaobOri2ex9zc
         fBOME9+3bXo9OsAXONQjKsniPUW7TZz2DRL4EjLyeay028bH5QpEEI/AuR0u38eKjLey
         IL1odcDbe0u0jmODC5JQEMdGy4s2PkODGDiWBtMRpcrv2bEo9aPZSaA88A6mR6KcOvtb
         wBdA==
X-Forwarded-Encrypted: i=1; AL+hErFIImRv25bPzUMCRh/cfB3Cc+hWbxPoMPeIhlzivYV2gsJofs1R38kvmmZnHNYrT+xlr44+3jBnArgRhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/js/+UIz/F4uYcDNrvWsgyo/+/EgtA+plM9psbGvgmz8lHw5tu
	YOJFa9CkxwMfwL/u4CEEYBXFExh2zbRkPRagDeV/8vr/xMZV9FRBZJxK8We4Wu26RUCjf0rplon
	OuFDDDa2GwFbNbBiXepVcC4OGKZoPC9jD/pmleZxL87z14DwtEqtDGB1l7UTrcnb4mw==
X-Gm-Gg: AYBFou1hhy3cPpt0waAJu5CCwkXY8PT7RiJnDOHaU8U8uWIEatLyv43mMO2m4WCPI8t
	TI+va4j+sZFKFpMBKlY664IpfR2Qwq3eFnmoEp8CPZPbN5CArAbuQuQMgyFOIbrtdMb01OjTbnQ
	v6+Hj/vjs8K791dxa1emxxR5Ga5Srp4M0ciRgfsN5+p+lF6gb7W4ydW8NGiSSfUGmZ5he35ycqb
	vtwLepEBMEJm9cQCO0C2LSqnUM5aGsW5CHzWxNtqZRUhrqtINEL/Dm/1/p3rMOixUhSlxduoBKC
	zf7zDtCe9KBDacMzqRBrnh/zsqywpMfdPpUEn/d2lDGHa2IydFYgJJj7J97eiZDN1dFgyPamawF
	KKw92Z77LIowWpEIhmeRuLX9W5APv9iX2aAUrdUc8hh2Zql2XpLlugBJYYB4JunvfETXTlsFg0p
	ft2G/PXUHNi3g2+DiwNFyQCxam6WIXgiSMYJGqyGOL
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089331cf.77.1794655792530;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
X-Received: by 2002:a05:622a:5c07:b0:55c:37c1:aef7 with SMTP id d75a77b69052e-55c37c1b4b8mr34089191cf.77.1794655792088;
        Sat, 14 Nov 2026 03:29:52 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:29:51 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:18 +0800
Subject: [PATCH v7 01/23] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 SM8750 CSI2 PHY
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-1-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1075;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=LFc6jx+MXDH94lWI3ZDmmoldzQASgCtkGLGfmGw+wwg=;
 b=qQbMkxieG7t3MHs39IJqk6/8ONMjTaPIKB7+zb7r390+yjZnta8SFA582Lw2EtjV9kt1MoFe7
 ZbB3RdBwSjZDb0AfWh6sGDhV1szHrA9qdW8cpbOGDDd8ztsmVi4NfG3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX7l6+7F5K5PF7
 UBt1BzP9xBtnxX4M1pd1+JxvWrQkgLPuK4PwgFoVpyGFejbnRq71Ox6FssYgh8fqKh6H/mw6sDy
 PIUwRTaRvi+OWL8B/MgCEuAnsCzfYXwMp5IXWx2PnfOUXrt+MuvyjJgqRIt25U+BuVPRrY+sgQs
 okvmYzH6n3IaK+G+fb6bzN+ItdEWP9UZX/sOqcayh+3FEUcmnfC3AkpvG4yImMZRe9SeMolAJPd
 XgHigeBkDODtn/EKF8Zoyz5hPjZRccQ7ggUM6pPlGIiHXDwhIgb5xbDJovbx04LPD1zi/qaaJQp
 wm5EP4HRG0FFAO2SnB5+QaicnBxZ4GK5YMbtfeD9d90u5ryy2Br+9fpaQcflQ1Y4/9aHqh0HskC
 5tDXns7x/Bd+92C9RcMI/jboDP8URwFrVtAvdznKmiU3u/ZxUlxHWKg2QjGTGhSnPFk1b5o9vjS
 /wTmPBVvYM6KKN4jf0Q==
X-Proofpoint-ORIG-GUID: qjfcI5uro7HS0Ucx4AFyFIu2kXsxSSpB
X-Proofpoint-GUID: qjfcI5uro7HS0Ucx4AFyFIu2kXsxSSpB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX4Vwg68ZMO932
 +3drj1W1PWfCreUbeyN+l9yoUkxu+hAD/S9jgUc2VCkjZHCRoDLrPF/cxnE6kg+FTVXFYFEvLPH
 EiSbY1CVqHKzUNc93TdqmpcK+zRcFys=
X-Authority-Analysis: v=2.4 cv=X9rHu2Te c=1 sm=1 tr=0 ts=6af84631 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CbQ82e2HgpuiUCsW3z0A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

The SM8750 camera subsystem has six CSI2 D-PHY blocks. Describe them
with a standalone "qcom,sm8750-csi2-phy" compatible, so the CAMSS
binding can instantiate the CSIPHY nodes as separate phy devices.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 6e9eb8e265df93b631101ae13f31f6365b6239b6..8ff3df1d0d2787b2af0499c1e4106b86f56ff82c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,kaanapali-csi2-phy
+          - qcom,sm8750-csi2-phy
           - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy

-- 
2.34.1

