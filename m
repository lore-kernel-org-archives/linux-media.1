Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793922701;
	b=qgZuUOJSdI1fsaac5GZ8tUaJ2EDLvkuv1mAyORNL4pM+JsLf2Mr9LnmJFF2lDI2XDUcI
	 amOAiXVug9TIahA2+FO5aX2DtFujeZs1UjFJN4wiz31jMfmlbs1VK1KSZmqJJY+Alcg7h
	 ilpoiFKsZj7xhrkwmeovN/2NXm3h+zEUnndpPhN5kFz/g1n5Q29AoTd1rUAYhKataFQ6+
	 IRIZEvpIeBFw+uMAW88mHJ1Hxikj06Ytqa0ykSguSitTWeUuvSdI3cDyCnEVHXWsce9lK
	 ZpsGWdWce8Jdt4OeZdi1xhW6pHBrsIYo9Uw0on/0xMpN+4eTPbdJ+FnPykAXIPSJ1eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793922701;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
	b=Rr3eaI4ZNJvceo5DUV99OqEvwRRM4/rxC/nz3hC2VyF9l9/5Uq0iO3cJ4LwpeTeZ2l5b
	 h/5Lbv00gZjv3WAYKOy6ye7cN2U3jP5Un0EBT97Vo2TFyRBQ8PugNCBCf1hZ8NQDi4ptm
	 HB62RQqMV9VYCMl8g6ybBf1m9etOiXznK1FeuYIZDweG0SZz0nWhYmXzwXIyUAiPvXOsb
	 8sEcjeS/HcoIW79tM2KphFKDzq1xL4FFxLlgOR1PoPohU8V+gN0qiKdzQm4ibl8iOVrFe
	 4nMCH/il7uZ8UndGmtGPyVY/YdpeNoBn5+q63jxhYkhL8+LzU4W4tjXvguBg47jrNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E825606A32C
	for <linux-media@vger.kernel.org>; Thu,  5 Nov 2026 23:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E825606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+UjozBm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eyuUzIZG
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5NeQNo3215977
	for <linux-media@vger.kernel.org>; Thu, 5 Nov 2026 23:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/f
	G/eqd55s=; b=F+UjozBmVBcvwneBwTSXima+BbRVI6h+ffQRqAhkLPx0ZQl09T/
	+ZLiI8aZAdRm5chsoekTmRXL0p4A71vUvXP9jbcEeiLICqNEBwlTv2KnjFl0AIuL
	f2Oxm3hA2LBTgu3IsodErcUB/5STKF0cvsEkcWkh0hGU6s8AsYb+nSdJmCyrOiJ6
	0LitlJ2NPdsEpx5TaeXZvI83XjRjya0Ixh1c0XkcNxgLMRyYdSIPcsY80AxQACtZ
	tJCbgXITWx7evwfhOrTDD8omGbTKEGw68YxiJMY+maGKNRTPovFasS5z00qNV5uZ
	GVWAN3iEFrBVsrRfe0bc2ymz9U10qA0ASFw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9r13g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 23:51:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33713e5e6daso98906eec.0
        for <linux-media@vger.kernel.org>; Thu, 05 Nov 2026 15:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793922700; x=1794527500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=eyuUzIZGudnj0MA776vVvBEe8rjoPYHQlsLwqnlZXfx8WKhla2g/T3YGDg5IyXOI7Y
         tsXNXCZLUEBbk6N/SrnrI5Hm8UsSzDvSy65X+HNefesQmYiH8pDCeaP7drmJqInN7WHn
         mnQyACIGBdP7rG/jdGUMlo6Kekn67oCJ6Gb6I+HxRX9Ti2k4qrA+EWX+KIMa1t4EvfFd
         B2F8cpB8xCE9XU6DEJfl7dM+/1omhR2PySZ6+7mg7dql7dNGY4bIjn/dPbvnIMk1M4M6
         5Iodbmfri42Oh2V9KV2DbYADUILhMCFeSuUPy11v1gkFYJJJx1EuNO0DH+3iMrK+W0bC
         a2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793922700; x=1794527500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8Ql98e94Qr0HslTjwnS4H5aOtXcYb6/J/fG/eqd55s=;
        b=VWToGnMbvjoZGwJPjPhLJnIFwIPHRL1yCQOkiDiSR8t9HqPuDfOkGN1klX8Ajnqsrf
         gDqh/T4211MpvLEC39d19Gu9xEwG2z6h5PwvDYilCBDLfGe2S7i3OKz+XicC077z270X
         S3Ki61ZSSezaz9fOSCp1OId3hK+Q3NN0EsW6ZcfQKDEZnricKt/BbbNt5SSvJYAlc3fP
         OSzrGctlVYSvcMEBAy9AddWC0b+AXHhz4dU0IvK1PtdnH59zIFDcw6Cd3ICoa7DoPL6u
         H9rWm+5EYZNatXPkKHFeVsa+7Rrah4txq2dBioS5j4H/T7NFfYEp416/jc8h4T/Cp3a/
         Xzfg==
X-Forwarded-Encrypted: i=1; AKwUvBxlT8Nklr0NB0Vb+pfdRLVvXqp3gziWACojJRAySL0Rhi0/cqP0g/pcm4o3Z6zQzvnFn5ptjZBtZAipLg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/VRrAhR+PvJMqBYTwHzTBaXOAXoDnPunKYe1yThvcnbAShDVAx
	TsaeUuxhBNx+E4E4UbDuknGZ+hQxJJxG12qhHiQJIHqfn0SGWYxxZDwtC0sczXF4y5iUup9dsio
	A37szDdfn2M+tWiVuiYcsmcemvLklXj78jldvhRjOSrvyad6uJYPiu70PQrwnNHjpZQ==
X-Gm-Gg: AYBFou1OcpF6fGH+0we+7Z5swb4eJvLugF5FzM1/YOba/HiBn+9mOS+vee44v/5uT2q
	HcxP7KtvjiEypgPKpwlMDzsHa01Xa7kBpkPb03sZgkuXW53h34hyiCNtEWTriN21kF/pgfBzLEg
	HDRUBfQduofnoxiD/3ZTM00aPpq+iyrhVjj5Td/nE+PCZUWoLMwGbE8YvqgmzccBZOxSIEhKsIM
	LGOhJ+VrjqL14zZ9yqnX+7EXb//rC9ED9yi+cGZEjM/vhKycl1Id9FJOrtrB+XT8Q5/zJUzLQr5
	xgpIAeOy3jd0gtDZi5xT0hcW3mAFRdRazjstEl2kNPWUg5tNJ9ciQ/wljEVbegQW1fUpeANRquZ
	P9fbryyjcYtoXnpu1t92NKj2QFid0q5IeUTppr4caR4CQpB61uJCmROGYRK/fn963+Kj7sklKnF
	h+Kw19fK6tEmSI8w3qb+Mmbz83RdE=
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690552c88.16.1793922699489;
        Thu, 05 Nov 2026 15:51:39 -0800 (PST)
X-Received: by 2002:a05:7022:b90c:b0:15e:3a65:5b97 with SMTP id a92af1059eb24-1b25d31e64bmr690523c88.16.1793922698781;
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm389041c88.9.2026.11.05.15.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 15:51:38 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 0/4] phy: qcom-mipi-csi2: Add D-PHY support for sa8775p, qcs8300 and sc7280
Date: Thu,  5 Nov 2026 15:51:33 -0800
Message-Id: <20261105235137.2635442-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfX652qMx2VX0kV
 64N2tmY8RbTcJWgwn8gS6++AbkjT+h+vgjAOkASiXu6Icic/6XdEypNOa1km7GvzIuD8sty2mqL
 OrvtDa/1fRF64Tk9D6z+c9q/5aeDSOc=
X-Proofpoint-GUID: zUDCqfFX-E9kfD8qUfYrPWdFKlKslAmk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA5NSBTYWx0ZWRfXwaQcfQVf5v9U
 muqyAOlM6y7UsbGx24T1YAYVT+YtqPYeulhd2VYJyD0CoLY2ub7HXSCQYgVBnude7/Tsv7PPKRb
 kLLReHNCKoYFcjDW7XRSftS0G0V+gAvAuVBknzuVYZ7W4oRPqgEYWQ/cRuUZUjRHjpPmG22pQCl
 MzEBW5LD6A1DXC/zcAqu2ngiLJBqZ7P2bwMutc59CMLWVfPfhIa9nWxQScb8cQd+Oi1lHMZzxct
 65qTRSi0KMUdEm5d3YLXuiygH1YT0zbglDbbUVdS/72/6isvP1uxJX8jy0BgSHU2h38BdjkMNai
 TJQJylWnJsA3NGvbv5QY/6dX4q1T+VIp2tJPH+aRFRhAT0r5AJhQ8ZmQZ9pA8AJZNY8n46NoQWL
 z4wscgYor2SU6MMtYZOJtDmthcF+4waqQfSQvyFMvgC2THZlceSbrOdpbFK0uInOakuzG3YVcuv
 PIZ0/RiZ0Pp+yqfBbYw==
X-Proofpoint-ORIG-GUID: zUDCqfFX-E9kfD8qUfYrPWdFKlKslAmk
X-Authority-Analysis: v=2.4 cv=ZIZCCn7b c=1 sm=1 tr=0 ts=6aed168c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=iQrEevU3y8pT7K306hwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611050095

This series extends the generic Qualcomm MIPI CSI2 PHY driver
(drivers/phy/qualcomm/phy-qcom-mipi-csi2-*) with three additional
CSIPHY variants: SA8775P, QCS8300 and SC7280. The driver currently
only supports x1e80100; these SoCs let CAMSS consume the CSIPHY through
the common PHY framework instead of the CSIPHY logic embedded in the
legacy in-tree CAMSS driver.

QCS8300 shares the same CSIPHY D-PHY hardware as SA8775P, so it does
not need its own of_device_id entry: the qcom,csi2-phy.yaml binding
declares "qcom,sa8775p-csi2-phy" as QCS8300's fallback compatible, and
QCS8300 CSIPHY nodes bind through patch 3's existing
"qcom,sa8775p-csi2-phy" match entry.

Tested on sa8775p, qcs8300 and sc7280.

Changes in v3:
- Patch 1 (binding): renamed vdda-phy-supply/vdda-pll-supply to
  vdda-hs-supply/vdda-lp-supply, and restored the DPHY split-mode
  port@0 definition (two endpoints, lane-count constraint) that was
  dropped from the combined schema, cloning it from
  qcom,x1e80100-csi2-phy.yaml instead.
- Dropped "phy: qcom-mipi-csi2: Make timer and OPP clock names
  configurable": no SoC this driver supports actually needs different
  clock names, so the patch had no real effect.
- Patch 2 ("Make OPP table optional") no longer depends on the
  dropped patch's configurable opp_clk_name field; it now adds a
  plain no_opp bool instead, with "timer"/"core" kept as hardcoded
  literals.
- Patches 3 and 4 (sa8775p, sc7280) dropped their now-unnecessary
  timer_clk_name/opp_clk_name overrides, and renamed their
  vdda-phy/vdda-pll supplies to vdda-hs/vdda-lp to match patch 1.

Link to v2: https://lore.kernel.org/all/20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com/

Changes in v2:
- Dropped "phy: qcom-mipi-csi2: fix -EEXIST probe failure on single
  power-domain SoCs" from this series; posted standalone instead,
  renamed to "Add support for single power-domain SoCs" since it adds
  a case rather than fixing a bug.
- Squashed the standalone qcom,sa8775p-csi2-phy.yaml/qcom,qcs8300 enum
  addition/qcom,sc7280-csi2-phy.yaml schemas into one shared
  qcom,csi2-phy.yaml, modelled as a oneOf compatible list instead of
  one file per SoC.
- Dropped the standalone "qcom,qcs8300-csi2-phy" of_device_id entry;
  QCS8300 now binds through the sa8775p match entry via the binding's
  fallback compatible instead, since the two SoCs are fully hardware
  compatible.
- Squashed the separate "Add qcs8300 CSI2 PHY support" patch into
  "Add sa8775p D-PHY support" to match.

Link to v1: https://lore.kernel.org/all/20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com/

Anusha Arun Nandi (4):
  dt-bindings: phy: qcom: Add common qcom,csi2-phy
  phy: qcom-mipi-csi2: Make OPP table optional
  phy: qcom-mipi-csi2: Add sa8775p D-PHY support
  phy: qcom-mipi-csi2: Add sc7280 D-PHY provider

 .../bindings/phy/qcom,csi2-phy.yaml           | 201 +++++++++++++++
 .../qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c    | 228 +++++++++++++++++-
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    |  74 +++---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h     |   5 +
 4 files changed, 474 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
 
Best regards,
-- 
Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
-- 
-- 
2.34.1

