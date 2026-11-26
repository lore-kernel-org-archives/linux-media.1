Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795699301;
	b=5GEu6T5xL7cy+gYroNTHZHmg6n+jG7POq8YSbX7o3s7p2XCXCokaMwybsBpcbgmDP5B6
	 Z2nj1qQ9x1LAlOdPqHwqsbg5zE7oIvq1Ptc53/pXuL1qG3SXA79cxidzcKSrPZ8lQKed6
	 n6a4IlnVpMr4cXwrEMLItlXLH+liKrfJ/l16Rd6loyukZIfDy7K2e2jHpdT4ih2kBP1x2
	 ta7KZTdfUpz5xfyQiuY8+dCZU0hSpPDctUEcZ+9ei00V1+BnmE0VvNZQkrLgkLLPj0JeM
	 W+QIj+UltaBlb2p/ny5tFMxT9hdRQIoyLGWKVuH9+dCOf9B8eiVgBzGuCsMYZoAo+Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699301;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
	b=tCO26cH/BB9kLIbNS3YZKzsRm3RpWGz6mHp7clD0OS/lui4upBM3UCRO8lwOpVAbHcpx
	 gR9j4YC7n6bbv056PrIWvus/hG7mujWvww6g9n//XrvhJ52nxGDe3hTaOcc6tUdNC3Up5
	 OH/A3OartkhZtpLA8FaJb7aIjGSE2KPjcRljGeXQ1oLHF0MsgkpGlX9fYzfZ54MaDwTkt
	 auCOAfFyYgpy2UUFyMUelTA65YLVJruLPIr5bnPKZ5Ly/y/YY9WgOn2VrclWozRPzOo1C
	 G5dn2TceLqJrFimnsJI3UepGafLIOM5q4gWN9VIYiY84nxilDqoYNiMCSf/EzYebptg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACZnDq3M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDkdwBDC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46616606A31C
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46616606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ACZnDq3M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BDkdwBDC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVNt34128433
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ASi9w2G7r/NBiKc+aQ4v78
	OboFde+sNbqo7EtDF+qdo=; b=ACZnDq3MC8yaqyoqDKebck6HUKexUs6HjmnTxy
	nuIz3EIPwCvEI1xnxfwdsmsP8t8al5JIVUNtebcXinRFlWU81yxI3Ba6YcbDNrR8
	fr/ICr5UWqrYWTbfs561SWkfU8RngPYxt3SivuzE6erFzOSLpEQkSOQVoeuIhTwC
	pOr0z6FI5g6kgW7NWO78QkySrk1JiAiOOylE2YrbK3YCe+SGyd6wxLGvgz8aENmx
	SvQ+aDLMvyss4gpk15+SUUlOfuPk7CvWq5mk+Ne9c5Zj8Dmyjo5TK65fUUQZZrsr
	e02ZZaXqlD3ommXV7ut18FIiuyX++bVk9TY4pnAaE0FWzl2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vav2xg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 13:21:40 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2f03aa5ff3bso89432965ad.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 05:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699300; x=1796304100; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
        b=BDkdwBDCCfUnIaJmCGPidLo/YqPGws5tvEmmKPDoHYfyo+ej1DUAFOd5FAHEp8NrVY
         Luq7x2APCCH4V2T+sRVhOVCD3XqW5qr+I+6uWtcdaubzofqLE+CCHas8/HXvhPudu8Th
         S/HMmwb2oOdwM3qNXoXsP1ZjHj7aYUuRDzZm6cbO4yEoDQel7kdrG5wnGef4nh7tzTnD
         quDQNz2wbR8UuRQgDEeigySO9OsuAdP+XsLUjcEbdnSPuZYsxxYzkDP7COwCQyb+Ay+g
         7hH9kV2cWIio1TwluaoyAMDuSRen+NWmiQu534BEw3PdCSArmCp1v44epffpInEMOyhp
         Xm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699300; x=1796304100;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ASi9w2G7r/NBiKc+aQ4v78OboFde+sNbqo7EtDF+qdo=;
        b=a0ncqpRocgejaD61xQtDINebOZ+wVu+5cFMsyYDYQM4JqwsJ1ldojZyJCYQO1jGId0
         ywyp8ekore5lAfLxXSa69MuKBFspYVhAymzC22o3sbOAgwVXaHy3eNcFIcEJe2AmJi6s
         QMe9iNQ/uuIaUr5bSoFQTWfjr1MgIATiFRnHKeWWb08sxIgC3QJc2TO3G42zcmj+Iymo
         qEFaYowtgiEObCrg7SiN0ONIYGB1mXG2vyecs/72sC1icrNJmghI6/Pv3nmVyB4gEfdk
         NJb/QrvQBhf1ueyq+1sFltSygvyOnxTncAZbra90cVtD3RJIWp+YaakRNYeOwYabauxU
         g4eQ==
X-Gm-Message-State: APuU4Z9k8oN0nSJCgnaTMW/k1Osdr6H7SKuViu6y/YGg82oa70L9/k8/
	ty1KZn8dGDSVAJCTC91KL2UgYqn2+v+thfSRsl6wr8VhhBBVLXttwe3l4Liz/iEjAyl+Cm7KHqj
	e47ytuEkRWq9aB8nf1AdIqSpMh4gXbezhth1taapOsKzHhgEUlF0pKLHTBN58Xc6RhnbGlead6A
	==
X-Gm-Gg: AZFdTZcnZYfpfoEXoLUwWcouF3xkMn+cLmMkqIRmuSLTwn7+P5Q016CoCWRDhtDVR0r
	6JCiyJ5PGtKF5PXJxSK0WlZ9+mFhN5Lu8vM3/AFNHH46DFubQ3mRt5Myhss5r7kuiKiYofbf7gy
	ssK93Gusj1+iz1soOp0AvJxsmVOT1IW4NLv/S2cBSb8PCEJtwfrhr5fG9w1VI/pj8KR0fad5nOu
	uarauNrudrT1ajeXI201PkVzXZAquzG85jNBySw/6ghu1mD5V3UYOfT+F9bRTAh0FBldQ02mgN7
	2e/6AXSbfyNelC6E31LMHDSLhyYYHnFKWKGrtJHhlYzvr+8PJYtdzRs4BK840O4BRLnN8hCCK5y
	FoPw/YFNY6kZji3wB0ieo5jmP/r/oZNiu8bZRiIIp3aQlGDccZHFJRXNcb9jxYIT/QeK+YLk/bM
	/zmNYB
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr216491585ad.8.1795699299711;
        Thu, 26 Nov 2026 05:21:39 -0800 (PST)
X-Received: by 2002:a17:903:1c3:b0:2f0:41c7:9a3c with SMTP id d9443c01a7336-2f041c7b2ebmr216491145ad.8.1795699299241;
        Thu, 26 Nov 2026 05:21:39 -0800 (PST)
Received: from hu-gouravk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c2091sm102542225ad.20.2026.11.26.05.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:21:38 -0800 (PST)
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 18:49:27 +0530
Subject: [PATCH v2] dt-bindings: media: qcom,nord-iris: Add nord video
 codec
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
Message-Id: <20261126-nord-iris-binding-v2-1-95c960de80ff@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAN4xCGsC/yXMywrCQAxG4VcpWRvojFAvryIu5pLW30UqiRWh9
 N0ddfktzlnJxSBO524lkxccszbEXUfllnQSRm2m2MchhDiwzlYZBucMrdCJ0176YzmE8ZQyte5
 hMuL9e16uf/uS71Ke3xFt2wdiyN9TdQAAAA==
X-Change-ID: 20261126-nord-iris-binding-a3e08c71f9ab
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Gourav Kumar <gourav.kumar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795699294; l=1952;
 i=gourav.kumar@oss.qualcomm.com; s=20260921; h=from:subject:message-id;
 bh=rwX2X/KJkEINyry/GicIz/WsvjLRsBN0nV+dyEuYIMA=;
 b=rcwY/jvWWf043otwYuucp8QOsqWmrZ2NrtAO9aH7h6sP7KfVUFUlc4AA0l8teCPK21aQDs8A3
 sD+W7kjoTFZDuHCE9PzKzON6qvRzL+ulh8cLUD8J6SwuAbJ69cbDZYk
X-Developer-Key: i=gourav.kumar@oss.qualcomm.com; a=ed25519;
 pk=pp/OfJjGYucjyEYKqArAaVDesbfWZ44Dom+QtAdDZ8E=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX8M4OCBgSlLqC
 i/nasHWEV35lgerJZe0ICI1aKQHHp49ZXwJI2KOAA3wQm738EolTBlp+mcTKfDfgZe5qw3WVeyz
 A1FMvvQ+lYCucQIfH+VCS3uSZbRMpwU=
X-Proofpoint-ORIG-GUID: ajaJwaP2-ivmirPIpDnnXr5mO8Hekew9
X-Proofpoint-GUID: ajaJwaP2-ivmirPIpDnnXr5mO8Hekew9
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b083264 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ba9tQSLWzef1rn2_u0MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX3ZM4kz1ZxAfu
 q/lTXRHWOcFy0/ZZUDUVXA1dR7rUCP0DvO+mBQRpAEWGx7cCx1h10VFJKYKYJu4QlC76qh+txCH
 6Eo7Sf6r6Ze0lNUuKcd/keIx54SZRg2Tn+kL4YLlNmvP53Sjk8S4s6922ZvjonuilJvHsTsvOl6
 hja8oVHbyCGBj4JvvfXt/aD0YLxR2BeP72qhxhs0LDwimPHRscXRE7tjsXooZkqJUWzthJL3rEs
 FZhD9GMEim4qGJZCr1+T+wrS3rn6L8g/FrM0wEjTH3nqjREwbPVlGdrwDTm3KqfIHeHGe79wrxC
 TeiPBkeHrpo9pw/j7nz3Q5nB1QwsO2L3dwUDokD4GtJ11gLTmSmzwrx2NZsEGkGQ8p1JibwQD/s
 rmqCN0zuhhaARCxYahMdMh+rQzHFfCzHZ59yqsR2USI0eS3AjiegWLo/i82PmSOPHSHsK1jNBIA
 vEMiuzUhLBBxraBrnlw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

The nord platform uses the same dual-core iris video codec hardware as
glymur, with matching clocks and power domains. Add a qcom,nord-iris
compatible string that falls back to qcom,glymur-iris, allowing nord to
reuse the existing glymur iris devicetree schema.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Co-developed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
Signed-off-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
---
This is the dt-bindings patch of the v1 series, sent on its own so it can
go through the media tree. The matching DTS patches enabling iris on the
Nord Ride Embedded and Nord RRD boards are sent as a separate series.

Depends on the glymur iris binding, which provides qcom,glymur-iris.yaml:
https://lore.kernel.org/all/20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com/

Changes in v2:
- Split out of the v1 series and sent on its own, so it can go through the media tree (Shawn).
- Link to v1: https://lore.kernel.org/all/20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
index 9c34829a451ba..73c2d54a5498f 100644
--- a/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,glymur-iris.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,glymur-iris
+    oneOf:
+      - items:
+          - const: qcom,nord-iris
+          - const: qcom,glymur-iris
+      - const: qcom,glymur-iris
 
   clocks:
     maxItems: 9

---
base-commit: f1df3263878748f8995d25f3ae566c49c20ab155
change-id: 20261126-nord-iris-binding-a3e08c71f9ab

Best regards,
--  
Gourav Kumar <gourav.kumar@oss.qualcomm.com>

