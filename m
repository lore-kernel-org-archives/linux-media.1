Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2A3BB67F
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459875; cv=none; b=j9KJDmeZuK1Os85tq/u2LUnpEfw2Cs6+I3Bt+LfljzzfWnK8SP1QQyGHuxme7J+zo/wCdD7X1GZ4FAc2sGdiYXgnm7JFgNnvdsqlbZ23sPbdpWeTJQZamL70LsfkUvHt5tS/SZoLnxQJGS0IqYbvvtUr47VrLN8B9vA6pIWHCZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459875; c=relaxed/simple;
	bh=i/EfGcaVwPdBD4d/EhaLA+xeFVF7rZ7sN3Hf7EI7L4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qDPAHOOkyTOKeCdrJXJ+F/b40ToNUc0+jqUwxMVl369pLiaTmUSgr2M70SUrR5ld788EjPt1i54hhkxWX+GTAqi20qvTQj47S/JKIsXDaWHraecwcxNV5rRT01LmDo/j7/s5q/28b0H1ZwA7NgoeW/0JKGpZ2lYUZMek/fK+VpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KbLXFfn9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OM8PlGiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KbLXFfn9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OM8PlGiy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6ZbfR3824010
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=; b=KbLXFfn9q7GCpyhp
	jOQ551fi83GZMF6dhGiRqj5X46Ep5WUQVO+ax+EQpo23DM1wjhbKRw7qcpxaNmje
	nsq5YGSd0CzTr3I5QiCFHzOmHaLQ99cwX3bqW3+OSRjAVP1E9tahWVDD6t0D9jGH
	0TNLPX7hJYHErggZ8XlMppXUp6TmmLGczEXsYfLnD7HW2n+j6YFCegNqwwKiOLOW
	+g2Alqs2/BTZ/fpmkuV7VDAlkKbfrU5gQjSr3M1MTl20O/CBW+Z1PLStdaYQtOe9
	D6htfSGX761UVIHKRnQeiYA1BZaumfSRtMEMaagu9Ojx8heuQAhW2mMZDCqgekFD
	/LO03Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpn41u9k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 08:11:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90e7f98bcb9so90870086d6.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789459871; x=1790064671; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=OM8PlGiy1AVGX8O0RMevY+knPujl+BMtfyGJXzHY23riqne0WWikact90YmT8T9/pg
         zwyT9ac5NQ1YctqBFOGDmce7hF2h7TDWtaE0vDOUAizJB93a/j+yH+cSJv6eeiat2jor
         djYpouShSebbsz4QmVJScuzEUiXVxq9MXdN/UcrH5veezd8AjzeGc/3v+gIfscjKWXZS
         9gZ4xPBxUv85CBEYCNox6Se7tB3A0IN9QQidG/zG7IX9de/FdeJHv6hlogmLWOD1JICl
         RtCa+6izw/12LrQx6Uh6TrK4zc5HEx9eJFJrZ7mznJOK6xhp8u/xqKgrKHzIFPL20wMX
         EFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459871; x=1790064671;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49efvhs3N7tvBoNjWBAmSpCtljSdwWvZsY5EPmUlnVY=;
        b=KQLVgYmE83fSTZ/BYIh87Z32CmnDeGUVSz0G6q6S7jZT+pRo9iyUkjeIrecc9PlawB
         g0pSlvazN8vT9/y86DY8Jxs4lUlSD7ykPFR06oDFFVCZ9CFshttcs3WdbG4ttnDBFnYT
         MS43Q3IMeBM4uc7eFYLPDSPH2nEAAez80abGUtFCfe2uoYahmFqlaUVanNG6IewSjIwd
         HVoaGO5Ht+Da+l/5ROjDWBMZM0FLaFg54heOFXBitllHCLhO+UE2vEluEA+Wj/CrzcvD
         xjoHWs3LClRL2EUMUOT1L8BSN1VT3tPaZsGuYQFGS4RGs+6K+cyzKLe0NIZzGQ7qgXH+
         wFww==
X-Gm-Message-State: AFuF++kl8d5LQlducRCxjb4mQvZxV40CnrUNh6X+w7OF7Xg9//Enqtg6
	YpdUAIRWKbrYeYS1Kyfz06NFO/lNpzm4Ku0rIi1mGuHq1WF5i0thI8qqxYDgODvcUg13c9Hnx6h
	EPxPtKKI+derjVeWyLsN/L6pNsh4iXdYKAfxejhNQDHIqUI4pNgp+Vewa0ixxqLGS9A==
X-Gm-Gg: AYBFou0CDABJckhaatc7Uj2VUhVykiE8U263UZHqCrKDRizDKZ2o+eLtlLJU6SZfVjE
	nNnjOzhnl7qzDI3ttnuFjUoLSRQnLq7aCVLuxftqjIpoIq8ctkGwQzr0xaLiHicYz3LNwSrIW26
	3yxYSzzyByvxQvYrjrfVYQYiAeOAmg8Sm/SQ1t+c5m9NlhBR/tD3brwQrQTWtUebKrWymcX30N/
	dd37U3ZJwPo5KAuCLNpeiSIQB1sjpXZBtIZrDVZYDb70bs7HqUp2IJIh41ZBnngZhWqHZvpAh/F
	oS5Xekso7q/YwondzHhOlP3psMURK6lznW3HWnmtYraEATQVl9wHjSl4+iMEH2eYUL6c0Q3RxGA
	IFp/Ke7GMLaecSbTYBRhOTrdZe+VnF0lC6SQhJ4/YJEZ36Kea4W6vS1ram7zZZNLqLTPPGYLr5S
	A7BtE2+T/tIa/CeDa9JgSXOLP8UNgVeOGb9srBqaLwM/RbufbKPDQ=
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089407085a.40.1789459871366;
        Tue, 15 Sep 2026 01:11:11 -0700 (PDT)
X-Received: by 2002:a05:620a:8006:b0:93a:661:56d5 with SMTP id af79cd13be357-93a299f455emr1089403385a.40.1789459870932;
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:7034:b557:872c:5602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d292d3csm48847885e9.4.2026.09.15.01.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:11:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 10:11:06 +0200
Subject: [PATCH v7 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-camss-isp-ope-v7-3-77b13d131d3d@oss.qualcomm.com>
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
In-Reply-To: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX1yIn59LexJkK
 tioYLzCepNBeb1GYz40p2eTQpBWXQEGYjD/+Kn1vdTgURyO6SYBKZhlODBnKOYIstejdUeIzmHB
 4Uf6XoGpodWh8LHYHTSMwoFBIb9CyKodwFHjR+PGB1R0DaIk2CAqADTycx9vpL0VqfxexcDzTPS
 NEbTWnyrCptkLj8QCApLa9ZtefS814Fzg8dRcZPQAGAN38MqHN3pU7QRl9JHCgjdvEai/6mR01a
 p94o29K9qnyK59Ox2qtEHx88RQ8AEKtIEXNf4jkuGavWx/7AxhZ6h8o4Cv/isWEo99RVB/u5Nwo
 IbWivshDnfIsAp25CpvZ9ICkeDQe8E1erXX5lFPK+XyuQb9rYE+oiHLO/tT7J34WdUYINWl06td
 3eYLHkpAnNLqiIoK7vPfEb/9JeumCOKyPdBZORy3toKuctISKkH7PjGIQkdjtXFAmhhilr5SvVo
 PFDwk4CWRMCOgZ5wEwg==
X-Proofpoint-GUID: R4avvASCrZSQ-l93zyH6ISHtSjIC_V1C
X-Authority-Analysis: v=2.4 cv=cqQOAF4i c=1 sm=1 tr=0 ts=6aa8fda0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: R4avvASCrZSQ-l93zyH6ISHtSjIC_V1C
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDExNiBTYWx0ZWRfX6dxI5xvPE0Vr
 OLzSqhDqkgS+9cbgSR39c+UcaK7hR1HDCLfH8k985mmAPnU7ZO+pREEtlJZput60anKXh230Cqh
 s9uZuChUEyt3qZ5wlyzEu1HizSksJVY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150116

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Shikra uses the same Offline Processing Engine hardware as QCM2290,
add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
as the fallback.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml          | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..90b54b9808e5999a4dead404aa2063ab695cdfd6 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
@@ -19,8 +19,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,qcm2290-camss-ope
-
+    oneOf:
+      - items:
+          - const: qcom,shikra-camss-ope
+          - const: qcom,qcm2290-camss-ope
+      - const: qcom,qcm2290-camss-ope
   reg:
     maxItems: 6
 

-- 
2.34.1

