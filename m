Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795433778;
	b=ICFpRqFafx9XPzXQ1d95Xvz9iKWG8qiRySSMS1P96od+jhiENA/z6n8PJc69wpCTgJ17
	 tBmSrR4bJtpCUs2Ef0ojtutrBZ/3Ec1vJOi6hC1FTA/pyz3BTS29DppTQmVMDT2jOWfIq
	 bWKY06T9qJL+xsMA2vhBP5JzQUHAaz+rby6hRnEpQLQNYce8joVbTrnuN1WCRFH0JAsb5
	 0ug6tVCa1BRdrDOH6pMJL21+WI8zkO/3IQssvbXcjRyXgOQ6jSZBqmf9s0hkbcw+6Uqcw
	 CZN3NGbl1pJBLrHeceeRBU6ckXgY5cXvhSdG0MKah7044vqweu+x46yeV6ufiOPS9yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795433778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
	b=exsdPTjU33Ns3f+vg5HEvvhEBSp0FoGRdW20NSo5MO6L3QgbicZogNchZx5KWpzmiAlm
	 LQv4aNjjhyqgsjg95ZSiF89J5rx+2lFPK3q3PdwaxN3BLcRbDnQTtdGnwoUXMhH0UkcIy
	 LD56ydS1giMyI+EZzp3XntRATiME5AlXLB2Gj3MWQ46IkgvJKQtGuEfEpcxvwAgQWMq7o
	 vtdT8rDGA9Oi5xgGHqQBQUkE1Xt5MDst8Rr86Tc4RvRnTZOWt4dJFs5pk06tv0Wzyiiiy
	 wG5WlBJyOuGaoh/4WSNwBdbKvXZE85YjNUbiH8IzskRxHTAnFNOipYpOA1SX61nFhOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQp1Mz6J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=keTUF1xv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5F606A32C
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79B5F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DQp1Mz6J;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=keTUF1xv
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9IaPt3490974
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=; b=DQp1Mz6JSfNUAkzm
	De+IjjIf07j41uVRuHOwhjcx2lBv9o8kPJAstvBkVYgDW0TS3vySyyfMCrShtIii
	8u3SBaQK9OWf2mdYkIQ4tn93EsEhAulmhb2l6iEppEZUt9ojXVm/sU8P5Oi/jRrr
	CJxhDAVjEwrl5dq3BcRoYDAJKH3rSh9Xvb3VySkcvbxo2Cu5ToohSup3YX4bO8D6
	clgokL7myiHZ4sCnnpSHuHoD9GJuwfdpuwIOBR2S+bQRzCBADfpxKif5hs3AfL3j
	PNlQLABDYIi8SmaZC396ukSPCHJIrwtAvlNUEEtqoEcN6QhIXbF6MhtJ48JSG8ow
	/h+rBw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evshcvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:36:16 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3f3e256e8so3139547a91.2
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795433775; x=1796038575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
        b=keTUF1xvRWA1qsmstOg8yucmR+XnZpxk4vEWWwsVp2gaZ27jMp3uiYpdGj9E6zscU0
         iFx/P/uH/Duqm2BEw1cnxHjqtF6EH0ojzWytIRHgS2aXxwGluvJqiWfPmtvlWdUQmv+Q
         p7jSfWjVemX2ZlhYmISIpUWxhZH+uhhts9aEWxS9dK4lcQpCZAnyVF/ZuLo4s4ztL+ew
         +UMKZiSsNJZm1LAiEwZYXSfgiB+bUSVVbMULcEEfDqFJw2jX5t1ZE4ZiNa/gdxEKS2td
         7QzRIxjOtbLBVTj2bPKBJ6VarB9Hw3gSbGFnQE97JLXZ5pgV0TjOyU7A2RokRBzlr2ZV
         E/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795433775; x=1796038575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0lU3jlQEaKoyGca77UmWWN4srY4UKoUV0/x2GOHDbQ=;
        b=CqjKlzw+KJCkz5wK6UGJA8dRrjA9zba/PM5BcFga47Rberu+zfp/bTyIRpn6hI0juU
         ZqPeJFJ72UOHlLTV6953UfhJALnPPiZvIXXPc776F3QWumqoZ77disBqYiOm71214SHG
         8+VVx4Sicm8n60JMQ3cmJaVrj8p0EsjN2B8v/505DypuZGdMaP9A+w14Izo1dSn5x2+E
         l2SecW21XK5XvUNSZ6p8z2CP03dE/MFG+KbATUk7fVNtQu8KVSNXMF9KwHChyvr+HKOz
         vXReTRf4IcvjUxBujihFelYk5TplZWGUlQohTOaW4HcsVaWGuhpethUsWjJOef2b7bQj
         I3bQ==
X-Forwarded-Encrypted: i=1; AL+hErFYY0/wiwpB7T9qEvSVD0pwVwngFrhGr7ezl4jhkpZV+V48xImCGuUmV7MlCWZ1nihVBVrQKLLdxwH5+Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z82Z+WtV/lgHSi7F3eQGdaOLjmqsAC1DCLwv/4BYDwxYX9/6SQ4
	Wha24aWk2MH4zrLuf5Tbm990Hb0CtBU09ZwgTpn2pKdl9Cp905TQkmxU88edncdWUOnEuv5d1Ww
	nSUlDrH3z6QaC4EFRQxNkRLsaiPjtpXjXWmr3Rpa/p5p0lAiezkKSp/q4ackQ9PElVg==
X-Gm-Gg: AZFdTZc+qed3BjEfvnQzf6MW7LnKWwAgNF8EWph/516JoMce/kathDAEvzX6+/wunDv
	P/YllZPO6fDghYsUWk6vKjPclsubz6lemTjbNMqsidWZGD0LVzFcMW4cZj0yMtJ+7nHA05mEl1a
	oDnic+HZyW9lI3YhMHkoIaoGmbrbt4EH2LdJq+a5Dy3domJcAIbUn8ZrE1Zmj/xMDR8FDNXGIaB
	ivvG1sTvt7uEZNVQ17qe5GwHlMAV8xexuyWHjQLyzWfTZ0Ov4iPbPYvRLXOaZ+MIpprEJQKDw60
	VPBzAMyr/1HfEOq1hJO54QHiKM8LcyYYbY+9REnlhs9UJRjNez6YrNOK4QemTFoL0ogOJHoMk/o
	CTGoMHpTpGYmYn3zh7B8KTPbAqkqJVnjMMyPeoIWm2xvoR2lgUyRFIJuymkLe047u9bwFuV2svz
	gPeYDS
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr9916312a91.29.1795433775366;
        Mon, 23 Nov 2026 03:36:15 -0800 (PST)
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr9916282a91.29.1795433774905;
        Mon, 23 Nov 2026 03:36:14 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm17489024a91.11.2026.11.23.03.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:36:14 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 17:05:59 +0530
Subject: [PATCH v4 1/2] dt-bindings: media: qcom,glymur-camss: Use linear
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
Message-Id: <20261123-glymur_camss-v4-1-d7db74f59e22@oss.qualcomm.com>
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795433764; l=1681;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=zjnor/BWgyrwK6XP+tfmoWltCexIIqOeeDD8ZoHZrVc=;
 b=D2i60IsClkxDgo2LFO2Fp0mVDOAaqsoJMbmRuw/7mcKjIsPCRStwSDKQezh6yKM0TR7PFY/KC
 Iho5S9xtIDyBKr0n99/buIibSEyLHV24bQB71iCdGuhO9EKpSCwRZ8U
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b042530 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=oASzbMbbwVaaZ2OwXzoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: KYjPQsYngFQsYLSK_NB3IKSB2i-yq9kq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX95ObFARR8tbf
 26EPMzU7JZaaIyAPbk4xl1iTm1yHyzWGbvs+MQlhKIJCGo24O/8xMxKePTF4uSIqhktKRkUwHqM
 KSA1zUTNxKHNYkLE+/XNhSKIiKeGFF/zNumy4KhBi5YMxK67fbt4JuOC+5jyHbuVlQjIU8MHS80
 WeDhYKy1PRYlH/hGnIbdUIiIUDB7jeLA0dUpJGVjdEaUPKmSy5U2Hpzi1VdjKSMcwqaPr751JlU
 ajBaQhuw5xMA6eeWE3Mfsa96rmHNAvJz5P8V4xC2i9kjFJkf4PAeBSb6683A//4cfvYZuXFW4O8
 XKWbPTL5+zDYI4e2PeDrOE9hEquMn4ZOxMY5ikwOge69LaWtX80CshQCqftvMdB0hy/6bUJWnRf
 zsCkqnI1p5TwAjE6/4HE51GmfyH2nv9RB5YHaMv3o6e/gAZLRAXuhJ1Tt1kzenWISWAHGkeRAcC
 EYTjThAYU1FhgAvDyhQ==
X-Proofpoint-GUID: KYjPQsYngFQsYLSK_NB3IKSB2i-yq9kq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NiBTYWx0ZWRfX/4p+98Qc9l1A
 rziz/uC9N7wTe1xlKIMt979JgHu97JeKX8O1Gir5vYLR+X0TCkH1HniB2gWVEaxjnmfBCZJblBP
 VFykXNmqLGsSut5Gw/PF/wtqUS/KPaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230046

Glymur has three CSI2 PHY connections: CSIPHY0, CSIPHY1 and CSIPHY4.
The binding documented CSIPHY4 as port@3 because the initial driver data
reused the X1E80100 CSIPHY table, where entry 3 maps to hardware PHY id 4.

Fix the current v7.4-rc ABI to use linear graph ports 0-2 by replacing
port@3 with port@2 for the third CSI2 PHY connection. The matching
Glymur driver data maps port@2 to hardware PHY id 4.

Fixes: 1e0c8f82d710 ("dt-bindings: media: qcom,glymur-camss: Add Glymur CAMSS")
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

