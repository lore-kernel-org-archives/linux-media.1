Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558051;
	b=FDAshcvL1j8yg3Ns5Zf83joZo4gBfs2ezkpt3EgDJeyos4GVjb1reD/tJKCMoDfY+SHW
	 TxtX9Y3gbngL44tVkaKWS7bSvaAXT8mQAjuyymbpOItad0j0r95cXj4tgbiK+A2IBuTlB
	 D2I7BlpqrTzH0mALHxKgxDivHTu79QaUfZafL8O5mBs1qlq2/fwZnhO4PmT17hCmsGh/3
	 8HtKs/dDj0Q4bXHxO2J18sbQc2Cr/AyBLtmUa9LT7eNWrZWScHaXCorhnkJUxyIqUYrbg
	 WiZcIkVMz3FTO1voUT6Gjm/pp1ZTyMOT/oyCEf9EQm/+fTifAt1mGuFnARU65NNswsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558051;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
	b=mJ+bC1BqR2KQo02tvZZ3vQdEDWCj5b7tAva2akKwSvby6HTtVKLtXHXTNSQtehWwdThg
	 wk8G05Mc8orGaeEjthwyJ198yk9pe3WJFtbqQfX2N2kpHQ5kZbZ59IluDoHKQRtV9UNOr
	 JdO7TegcQohZavB9IZSzL7uU+aOL5pBPxCQ1OkUsaTuC+rz1Qdw/NlSjPkUTjWsFnpTND
	 bAyDcuNsiWEEFRdRdTPZGFJEMjR1no/Es2xauCw8mTqoj6g//kRduv7qoizNmGukkyKQw
	 cQv5f+plpCBtLToQ8oBu4sEuTasAmsg4ffudm7Y00vkB0JWdoFeCG8WB1vHTr+VKJuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D535B606A8A4
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D535B606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XOnar0iu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FsSJeJWM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD6IKv61164399
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=; b=XOnar0iuZvP0vmra
	srGEP4McvcKdTGb5rWUtyf9UovnD38hxYKrVFDe1yhtN9e4DfqjDHP6d02zqYqI2
	VxtFjCk1o/AjS4Gujc5zUZo3Ma1pJ3X1ErGLf3uc6wjRuoo5YTWkE7wGy1soLNP8
	zNbjMlFSr8YVk0lQOM1181dOFGn0pblNRrj5TH+8GCcm545fxBq2BrKX8yWJycae
	U/pE5qhwi/Nto1tATrbt11ts4iL+GNOlSPSdti+Jd0R45WLVLHusUo3iduQ/CteG
	Un9c2TlG+j6g+HPFPrVijhUs4kqFlAKK+lNRm86dPnvTXexftWQ075TJeZ7bi+E6
	bsi1JQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hww5r8d04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:20:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d1353fdcdso3242296eec.0
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558049; x=1795162849; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=FsSJeJWMSrCY5YLT4Y7H1Loni1WXW2Fih51KoJdqPV0+36RryA/o6jlLQqK/V+Ouof
         mztMHHzfwFOMD6wNyzMDKAeSKR0L+nX9lpADD7o1WvO8lB3c0Nr4ZQM4VabT5bEtCMlS
         6PlV54CBhZDHJngd1dfgp/lyfB5E9GTufFsLYVrWsUpph11dVrVQDZywo+wbHCs9bNnW
         +272W9TcFsgQclQ5lLWJm8Pt39IhlWclEs9bOYFpJ5ozKCJmgHvSC9+XJ9A66btPA6qe
         fN3A2E9YUlRwO1EDuZbYL+sbCPpTDfCY4rHrE8hP2uLMGTO7nbjUsNqwD34gLAywVrJa
         9Rmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558049; x=1795162849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB8bdyIAenUYMRW0QZpRkLcjvw/MrzilhnvYAl3NvF0=;
        b=1/Xom4x/ktS1kjkywNyhRER51Zux7mu/5G1olfOZXrzyLhzuJNMx2y2ZUdZwoXla7o
         +KT2ilSYMK/Wgymddf4kaurmK11qRgC5wYtdt/fc3tUkv6UBp+GfXSP1CnU0EsQ6Q8Gq
         YC8U9Mbqq8uAJFtRgQIWgBZaabgmaXaTYTFsLQTBk4pdpU3LjyyQjOAT0K1YsUUtwDHI
         rpSNKIi2RGahAGjfpINbOGsoDaEHg7RwtpuotXX+qNd+uinj2vy+Rf1By4SZVsqkvzwL
         V4TFIpnKvs0wCr7stMKMAQrUN9crstJNbR4rmVO1e/00hHKRu0Vf6KKk6+PoC3icohkz
         09Ig==
X-Forwarded-Encrypted: i=1; AL+hErEmhY/jUimu7eLmh2J2WN7uiiK4jM0Fb/KKcJaAAICz2nd73jp6smiPrAyyAto4cMgLPl7OF/fb4UQ79w==@vger.kernel.org
X-Gm-Message-State: APuU4Z9js7GAYXTdOQPUGdtI4J+XbGwEPSRslZ5zufsApmVaal/c1T1U
	NPl62RUjjlIehGqFhBwWwxrqWAQs+uaVYm18UhbqRgWaECzqYyJ2TEpddmJ3NmHw2Bqyyt24LpA
	0TuCyw++PUiMGIiEANs48STqoX7LWVJDIvpWNsijXf4zfXIAyXMZ2H+dzIG6OxFyIMQ==
X-Gm-Gg: AYBFou2KkcPfHw8/85NLw2x6NJw8mdgqdusua0VxfjxjVEVc2D0t7+TKHJ2dRvwxPCm
	evKED0dAT5J+OxlqsAlNUk9hLyPcnmNVXdAN69l1RoqfFI9w9iHzVzWYY8obfiajQWvxzFnR125
	aeTCb0J6nS0Jxo2rlCR0iZ7RovZn80d0bzOer0nZyMEQtbKvl9x4hT552wxBdoXMgsNmVbHeZ6P
	4f36QJk4TsmlkrvgKcoeDSZvehIriXkDaY3k04SDx+FaeyzQFh1D1c4rHMqNihnqNWKWAKYyL6o
	MUA/1vSQszr3YXv8VWHdSWHsyEH8VxZ+De4h67W987WzK+pw5sGrVrM1T6jib08t7atovnkZnF7
	6XjkIrhuVxEw7pQUiaItVrtGqISVRuVjdHNRtP0833BDf5cjNnwzx+2il7wC5tN1jFaYM5P+y86
	eTqGzO
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576634eec.29.1794558048615;
        Fri, 13 Nov 2026 00:20:48 -0800 (PST)
X-Received: by 2002:a05:7300:2717:b0:36d:394d:e696 with SMTP id 5a478bee46e88-379679e33b8mr1576597eec.29.1794558047883;
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:47 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:50:22 +0530
Subject: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
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
Message-Id: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1388;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=PuZTlOZoHF/pMdejS9tAzCDoNgWwALKveQWqW28u/qw=;
 b=dCoQcm5zUnZnBakJObf5tk4CG8Voi6YOt44Tna9inGh6/wAOgqc4RUMwPQxcpHgbv6UiTpU0p
 04G/ojRWDWdDiCivEY3L79mZsI4Kx89yVjXuoas0P6pLpQtScEZmFSt
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfXy/EUduo53tal
 2VQjX9XMzDEWycHR9JRit6OEAzeOpNS/jOQKvJxx2NvQjmP7mhvcdqQlMrUGoIlMkoXk//15jJ9
 61PZP4qZ6QsyQzhKA9f8R2BI9iN8upw1obSXRB+tLK7UdkLNNJLVwpgOukObJRLh8hkckpg7lop
 nfhpSmJjNP9q7MH/jeKlyGOBWbAmDK982QEA8rsYqxFQQLt3h/phNXbsmMHsdqNAvVBdm8ld2eO
 wui3jfPh1HM1Q1pkKSy1cqHdqO5AZGd8xl6BOEif90K8hipen5bu/egqAnPhki/nPDUPkKNQrro
 3t+JnXfHp6VnOofm9m59/bO0qvzTgMBLCPVx+2xhSYaeXYX9A7XjB7ZqT4R/C8lSQ5XM4dxB2rZ
 Xhuczj+0zBhJtvGLrYY9GJCKsjqeFL1Kk8Gc5P8sgW2iOa1TDUfcn2K+LrI3HjVoT5gOsN6z4BX
 7qnqWNb2FkyZMsEJLxg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX+W1OSrzU8m9P
 xegAxyO/1UuGU78WfPbcI5cK1JHGiTfemEAJ4QG5wvUyjNag5z3J666MqF1Rc2tnQhpyO8ClrjM
 I+Vg16UAa2sr4nWWM24MUoiJslrDHPo=
X-Proofpoint-ORIG-GUID: n3cnHUX0hppSj1V6aP8A6uczoFJGIlxU
X-Authority-Analysis: v=2.4 cv=Vqq2kO2n c=1 sm=1 tr=0 ts=6af6c861 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=cfbElirpQlrRZ6I-D6QA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: n3cnHUX0hppSj1V6aP8A6uczoFJGIlxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130033

Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
binding.

Limit the allowed ports to port@0 through port@2 and update the example
to use port@2 for the third CSI2 PHY connection.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55ed4fab194091c02 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
@@ -109,7 +109,7 @@ properties:
       CSI input ports.
 
     patternProperties:
-      "^port@[0-3]$":
+      "^port@[0-2]$":
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
 
@@ -288,8 +288,8 @@ examples:
                     };
                 };
 
-                port@3 {
-                    reg = <3>;
+                port@2 {
+                    reg = <2>;
                     camss_csiphy4_ep: endpoint {
                         data-lanes = <1 2 3 4>;
                         remote-endpoint = <&csiphy4_out>;

-- 
2.34.1

