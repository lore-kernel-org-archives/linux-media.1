Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100681;
	b=bHxvoD9ABFJjvHjqjOKOcDOzfDbK/3EzhmIgtaoiSYdkp1Mu8Tp/Z1peTcBoLuedZiQW
	 1pbs3FmR/p2J4di8tA/Q8LNANIsZIWCTN3MRnyYTogRFTX9g5NQaHYMlON6XLAEoYU/3Q
	 L1RrcswfWABaMdLiVGN0V7tw8e1H+FOU7FCo8rhzXQrSr9R3dBwFVazp7w4bGGYu0qXJM
	 OB7uqxWoNyQUpACAJjYIb8Pv8YCsk9/n4z72ylMOGc2fxjMqdkkZDsLmMrFQkzP8F48ZI
	 HClsnO3XMZ8+Wqi3xhhjabnRr1zm0Cjx72YzMZxv9WqFhZ+rrFQy3iXxsVSUn6tR68g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100681;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
	b=q4omQNFya6AYWa8mJid17Xa0boj+4koCHOYuJToncbVED4LSndz7IYyY01+bE8G+oDfc
	 BfHNgxOsnMj2oQbG6An2RrhJMuP4xNcGt/lY0B/5PTl8TCcV5N693e3Tw21XNmGuyDmwv
	 aR4GrZ0UBAKn+i4iGL4XcgzDRTloU7uLusyHNmaTTqd3I9O1w0rGv3yfOkOAwrd72pJcr
	 6nSGRg0FRdxMfagxZe7Mt98OV2v52UTQNOK2vNakgtVJkwS/cCdHJe4Avh/LQr3yXC6iB
	 zSBFAQhhspq5qlHmpWFRB8WhHdmOFjzrWwP85Vn41ZlS5RuD+KZ0/KbS48CjWYJp8gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsH7ob+B;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51A0606A320
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A51A0606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kq0ZjYZF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HsH7ob+B
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBk8Rk2843768
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=; b=kq0ZjYZF8IEclIc8
	XnkCK/LXhmlXpTCHO9Mql2pWopVYvo6t+Iq1esu7ql/uYOHPULalAzGsXBUkHb0V
	GZ2WhMfUUQQm4hRZBXjMWuWwM/AO7hxEEU92I0LVyjhKJ34qvKqHTjkeYUdbTf7t
	9xJFv2vM12RiJOffYbk5teRA+fhVSMloIAaoDdblqJTCkxpwI7r9kEN0DJfz1Et3
	oApL2ohz4iQY5xbH4RUB241h/7ozrFLHP8ELgAVp11HLrKKwx/N7Ctf19TD+M5OZ
	xlXPZz1LBqZsC5sBVwBzP64s+wA36NWoDcoNWjE6xXeQTuA22Br6jQv92gJ+CJ6N
	M9toGA==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xc6sbb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 15:04:40 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679b648598bso3406941d50.1
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 07:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795100679; x=1795705479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=HsH7ob+BMrm4G6AzCHTvSSMeGZtGT7ZGUEYxG2Mj0h6a9+6W3MWcBuLu6fUoNZAUUz
         jc0JWItKM54GC8G4L4XRD/60ocKTYZtFUYbmStHc5G1rOa/rIixxnn6733w/jEOm88PB
         VrGkV9oHZtQlabZbMOa8Ps0w7WxRL+GR/vMn1E254wvUTZ7ohkK2BOU0AfnzFE0/2rbu
         5EVem+ujv+Q2Dkl6uF7ycXh7iqrzgDjwDhJFyr/wKiH3tQ2Gdbp+ik285K5rVWuK009A
         EFALnMYs6UQ6JhecG9V2mLgXcLRiOBp4cKawXHPh6cNoEt51jNNxwvnpYOJyi6TlmY76
         0YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100679; x=1795705479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9dDFOypbGSRXFMjpmv7vaHRjmeUkie/hrxavVTVI9H8=;
        b=zsZTy8hckzAlBnlKsoAGNtobia1QF7DXbc+SfXVUx/30PnfTVwKwXgWN9CwGrAQOaD
         4V/Es2d/5S36fundzhRm7NmJzibCrX3R3KWV29AI1rhJaHhukR3kSCiTctMuXA06k8Kc
         MWjXQGM5jlm4Vqcud+1lv7cQUnr1uKdRq3Xy0HT6quCMP7T9LmoUfa1yUHOlxNXRFcTa
         DYWNvBNp5BHkNhtJ6ZBf25TqcI/kP+SsrgbfpTygP2BDfGKrwCxIVgTrMZGTWWY9n6WV
         pVyM2n8GtWI1c/odNoh7OzMuo8+O5oQc1PzpfGWM/TDtKYM6V1e5aqTrVxGQjJwKzoyk
         KWRQ==
X-Forwarded-Encrypted: i=1; AL+hErHbe0dKW8rwxr3cj/a/j7lHcp6W/aD9o0DWUhTN3HKidYgMWgjmkLxP8h93ALHUQ4Up2HfhKvAM2h0NWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+kfSdRDQeZ/rqG2wiYs74cZ3mCm/z4/46IiBfyischp9g3tHC2
	RRFtAgFIZU8Ox5udQZ8RrLZ9GIJYJt3eUjpCDT/I/2c3iQmf/tGohd4p7BRdqsytpOMgBP1+fL8
	LKDoyxde0G414kM1il/3I0zhf13G5teEY3yIjj+JNRaMsH7M/EZUVYkG1xhcq0TGJdw==
X-Gm-Gg: AZFdTZdlxZT70peFt597ei2uH3Gejkr45iXLIiaN/jZeTajHl7YN4CNc18s8F3OUOx6
	PwWOwPoh7fXv+XOBva4/YOv5Gj4Em9wHWATT98Y4ySO8cIMpjfScI9Z7fKL7Q6vkQW28neqn1wp
	Nt+EXkoNxjfRqXo7TOMlDGVwFtvKESyyoXZKI2VgxILR6bQQNbLph8hCO9ra9s1Aa752NU9bU0H
	1pL4PM1Hlk8bQF7kboiiWEr4XpNGbXAA5hD/0E+o3jE/XuhKHSgcDZ5ZnfXU8n8mtzJD/IKbVw6
	vBjluuA0T0ebkY1JbkdViL6uyefvbSE8ZlIX4l73cnb7rxaDXQav9nQuP7pbIgIYPM7FU5fT0Uw
	d3H2aFscO16U+3u+ZOcDkr3Q49AI0DF/b8GNX8M5BqHQafxE6TaVb/qiL/CWW1ZlkpHmnbEJ5UZ
	nppX4i
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735271d50.6.1795100677556;
        Thu, 19 Nov 2026 07:04:37 -0800 (PST)
X-Received: by 2002:a05:690e:168a:b0:67c:2421:f2b2 with SMTP id 956f58d0204a3-67dd3cf9f12mr2735212d50.6.1795100676977;
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67df33d64a0sm79790d50.22.2026.11.19.07.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:04:36 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 20:34:22 +0530
Subject: [PATCH v3 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
 CSI ports
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
Message-Id: <20261119-glymur_camss-v3-1-71ab966c41c9@oss.qualcomm.com>
References: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
In-Reply-To: <20261119-glymur_camss-v3-0-71ab966c41c9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795100665; l=1615;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=3SVM2RsbonCgsgSoLY2zONHaCQGkDqvlTsplAN4cbGY=;
 b=rjokAHLP7v4iGEBnNQxOz+He8NglBkMudWEz8bESTeFaAWase/oibnkG8M8RJCfPg2ezzAVLQ
 QgbGp54zepaCb5SoeH64O12mh/ybNdtHTBQDwujcLkCUXRi2H94ZQtI
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aff1008 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bf6BjHq6SqOzxvFPJRcA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfXzEnbJulq5Woa
 +wGaLj5b0kqHbbx0VDo1V0rHhws29odM9UI55EI8SErwMo7M0PwMihO1uoqecCZkqQMYfy1Hqr4
 /UCEl260tH/goETCxp6PE7MKxJWtptjYGAFQjv7VZjCtBii/Rk7YY01BREopFGSf9VkPLsETcdx
 IeBXhpAAu4bACjLxpsf0t9oUtDnxoBWFF4/TFhcQhQrx88Oy9lYJftk6mhiFMCkqtT+JqfMeuL0
 U4k8f/T11V6XXHBxrIZ6cXKiY08HzsuWdUMXiF/ewDcWR76/n0xQxS4donwpJSlQWhUmJXeuCRA
 B0inS9GPQUunabuR+KNv6Yoz0xpyvdGRJjI+Vy7vGpgPtfxKCYNPJcECpr5JedomaNfvSv9qAcr
 FCL8GWhZ768gDLQHfrwEVMkPc3+64TW5lwJeSI2yKBjJff1psEP/ecnlF/CojwiXSRlrczkVZpg
 9CwBtu/OT7+UpHr4Bmw==
X-Proofpoint-ORIG-GUID: j3Mg61Kh2Og20n7mTAS36AcFPG3_Xzsk
X-Proofpoint-GUID: j3Mg61Kh2Og20n7mTAS36AcFPG3_Xzsk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1OSBTYWx0ZWRfXwDZsN6mtl6KE
 +AicuTGfaDwD3aygOFlwK+VIaXtCHlzMgPkdUrARR38xZ7Tm9n6Xce1AbVdGmmGyK5YUDF5lpfP
 2Z3u7l7yKGwadf5tWD7hyYy/DblyLSs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190059

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The existing ABI used port@3 for CSIPHY4 because the driver reused the
X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Use linear graph ports 0-2 by replacing port@3 with port@2 for the third
CSI2 PHY connection. The matching Glymur driver data maps port@2 to
hardware PHY id 4, and there are no in-tree users of the old port@3 ABI
yet.

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

