Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794897283;
	b=c4gGiPo/ed2vXysUrH3lPsL98xtZ0EhQT8yxrmabLThwf8q+3blR9VhfqZm7kxPQgX/A
	 NOkfjJNQ5mTGeHX1H+qDmKVXLd8xuMTx63DFbSH7hxD3U8ftmrzcBvftcayUKw71kut3A
	 O0JLZtM5JLf4iV2+RmhN7fQ3nAsyVmM+umqlN90VzFYF16H6h9ygqZpRl8hyuFXKXywtm
	 PpeHYzZaNgV6SW2XMa9RUQyLUo1Ggj07poCWiFgKyadA0++ykGrxxkGT9zrv4HuJtKAjU
	 zlxB7G/u9a9kMu/nnmCR5pB4VfF1/U4eTi8FPatDDTR2pBx2YjapGGJ4+WGsyxKK43w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794897283;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
	b=mpnFnmqGhACIfun2psdOrxoZ0JDaZc2jVL5Pcj/BmOnWFn2zdzhAQaJn/9RRhzZrxKoa
	 14mTERtY+6zvCsW4UCK3yGM/hzbcRLRcO0+uEgwZOYVZBF/E06rFnqgNEJCQ4A8E3S0YV
	 7VaGk/OZp5X54IzFcT5bKungNoqbE9EcFlq/HK8QcNonQmf6rtg889+CaxxZqmeklZTMj
	 CMIgL3+Y8p8BQqz+c0GCwIQitmslQ0i/eR8arznK7ZQx2u5uBO3Ru7Me8vzIffxpCUGV5
	 p9nDxQss0PInZnFyi1ygwWDrQ/cVIKM3XP3GZsT788PtFEioCWBIqnlUiNYEemOBTxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kwSZRjBN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUGCZvmx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FCD606A32F
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76FCD606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kwSZRjBN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JUGCZvmx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH654Um3595427
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=g/AXX8p4qj1qLShF67tisT
	sKUUeSf1IjIefQ6GJ36wU=; b=kwSZRjBNUVeNvNqDGMZa1Cc22BBpg/6/uho/2q
	dkOf3xBlTbhqeEBfECjVb15Y1Su4A/48IC0NdFKiEXiVpJ6BNHg2itEU7EKiRenQ
	GL0POp3QDQXsJcBUBFTnMJa6zC3FI/XmVx8HIn6bDP102pDDpyAW5kdxh6A+tuuu
	nskVnliDVr5XLlk9pdW34Qvyd0DpiRP9GPA9tn9g1LMT4GyFGOmxs5rTw1H+6613
	p8JTBbTztllH6H3BcaahFLJEWhtZXOI75pxw6gYaIGcTk3w/xw4CZg6c9L9eAgPc
	l8J2hFbHRLFFAkPDLSmkOBgVNcPTy0eaR8KbSloG2bnzXsxA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0geh89hw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 06:34:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so3283489b3a.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 22:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794897280; x=1795502080; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
        b=JUGCZvmx/174eCYATCACtre4A8Xn2abGOrTjRTp7dIRseJL6WemrgipK7Kyr5T1Y3x
         EiBsTqhylxrfCNbMrrbbW8/9k3JQ9FCKqTQMle3EQ2OucbAc6ZJBZWCh9JJM4EMyoARz
         Uzs9yu+GhlfrHdycNEBshzvCW9Cmw7VUWWM3qH4bCH4pPfOwpouPqyHF8gWWFdSIiSQw
         /p0Qb5AIddl7i0AUnsnZkF/laAGg6bEshjUabOznf9LAX4lpLANChgndPsXSDFRAqgpl
         Gb+5pljP6lZ4GAMODN4J0WEtQFE1gnImPxDrhuldv0Q8GonrOejEWzFzW0e7AIdVkrx5
         x+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794897280; x=1795502080;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=g/AXX8p4qj1qLShF67tisTsKUUeSf1IjIefQ6GJ36wU=;
        b=vuMDqONNdAn5BvHorLIKKhk7g9xeY9/3miiu75msASA2i5Mqj6UdOCsYGn1ppe2sqS
         2nCySfqKd+0yHhH4U1fBqfLotsqKT5SAH6neVHXNdUe0ck/aGzI5eTnJms3V82ge7W/c
         mJtOODNEAKaYW4M30VN0Xy5w4nL9bKWuUeyvNU1x4N9ml6P5oFWL1gQ6HwDIiaRkVAko
         JbB7u9q8+GTS/tridpjg9TwPMj1pXlItqdJsE2zY0nSJF8HoDn8zV50l7quTQ9t+utPQ
         VCkRQ365AsfU9Bx8eaOXyZsbWF0UVGEtjvx09qgJcVDeW2Aefp9yn+Yk346tnWFBGnnV
         /8sQ==
X-Forwarded-Encrypted: i=1; AL+hErGKA03eFTJ2f7avT+FGVXXxDJTXXrMqRcS5Xv3VgnULDkXNmoftjUaatTJDHv88rZ1cgUtbknkOVkR6Ig==@vger.kernel.org
X-Gm-Message-State: APuU4Z+Spcp3GKAb2R6V3QLAhYDp1SJA95KiszB5oFVfVCacIBRVPWWa
	Qw6gzKWlKhi++A+QXpXv+VPt9uyClXB3bZxgQB6/zFfIOvHQgoh8RoR5zqUE9myNM40BtBzI2nC
	o8RYRCqugtlAMlsPftkoH7bn5kGmMX9LykEUN1BWe1ypA9LwX2uRmMqsTp5+w18v6Xw==
X-Gm-Gg: AYBFou3vGbpjJMFmmUI1KJs43/fDfbgeZ4dhcllaKLy+DwPxCTlaCZhMJYPK/NkscTE
	+33UqjGATSq0xe5kccmZa+WMf/iqi7eiFA/mH5KACTwIk7tnZsuHF2SHhrEVKl0tA7tCN3z9eB5
	AKTdmkVdoiUG1ZRYdFtOYdmmbmWGh3vnAob9rcEqsLvnl6tlLvC3IbqastcMNwQR7vhAARKowTn
	KJaJDORET8abrs66vDBo+pRERmgpjZwHuTxm3d4qIjIL6CiZQc6g7XlUe1AvAKli7ilb8C7Qcn9
	zK/rPpUknt7ELSuowxXldJn7I/jcNPbwMrNBx2L1xzaxHKkQJiibvBeGSVMV0xAU13erMVSBTAT
	QTPjFyhcAFegUo/jBjYpqIaBYeJGYFDP6ZPImb1VCf4nPOv0mkUfRPSkAf8Nz7ZtAz+JrQpBFut
	IeyVnI4ZYLC/OGdi7tYi8zL9zsXJM6J35uw/FJv7rHGK95ENNT
X-Received: by 2002:a05:6300:483:b0:3e2:8c8f:f11a with SMTP id adf61e73a8af0-3f7a87cfdb8mr10237681637.59.1794897280021;
        Mon, 16 Nov 2026 22:34:40 -0800 (PST)
X-Received: by 2002:a05:6300:483:b0:3e2:8c8f:f11a with SMTP id adf61e73a8af0-3f7a87cfdb8mr10237654637.59.1794897279531;
        Mon, 16 Nov 2026 22:34:39 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc18b4e68sm5202219a12.25.2026.11.16.22.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 22:34:38 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Subject: [PATCH v3 0/5] media: iris: Enable Iris video codec on Eliza
Date: Tue, 17 Nov 2026 14:34:29 +0800
Message-Id: <20261117-add_iris_for_eliza-v3-0-02a55a9272ef@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHX1+2oC/33Oy2rDMBAF0F8xWldBj5FtZdX/KMXoMWoGkqiRH
 NM2+N+rOJsuQjcDd2DO3BurWAgr23c3VnChSvncgn7pWDi48wdyii0zJVQvrATuYpyoUJ1SLhM
 e6cfxkBxooa2zQ8/a4WfBRF8b+vb+yAUv12bPjyXzriIP+XSied8NYB1E1IMAYaGHkEYjJAbjF
 RgZE5gwAnpgd+tAdc7le+u7yA37r9oiueA4hhCtH0Ma3GuudXe5uuP9+66NTV3UH0nJp5Jqkkk
 4+MYJpcUTaV3XX1Hc4dZRAQAA
X-Change-ID: 20260914-add_iris_for_eliza-cfa43039a976
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794897274; l=1929;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=KqHCk1CExbEQKbOp47126ICIyfQogaUNymyxYJPGKsw=;
 b=4q3NAOT98xG4yCsAzKwG6NOVTvRWSxj7o8meFYC7mTOIPXYiDcFLy9QzfHDIKI2VAAhAYNkwx
 pn2jCsh3BsICm5cORmG/9Hgi5pgbQlFJcnbA/WYiRHq1uWZ3dsKJ532
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: IU_RTAWpvZeWG6ZAIa7WYgfWVO4G330s
X-Authority-Analysis: v=2.4 cv=dLkzC+Zb c=1 sm=1 tr=0 ts=6afbf581 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OT0-6WW5Sb5gBQYBlqwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: IU_RTAWpvZeWG6ZAIa7WYgfWVO4G330s
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfX7vCFTL3h5v8r
 2klBdup8FCeUn4N+Dx9GE48hgGsdZzEJY7FRIAZLiDZlpbzqaVFDNYcYnzr5rXC3FXQ5kf/7R69
 wkE03HQL80qtHaxMvzGPOh8ik4xfYak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAyNSBTYWx0ZWRfXy0XMGEbXxFAy
 es7ZG5my6EKhU80xGToPj5Mo2UZQBYekPmd61PVsW1dGgvSmPWaUF86XCRivd1rUjMjMiw4M86H
 Xbccg+OklIi+jtfs3t/EFhhu7SfylR7zXjs0+M+i4/Lqi6pj/VAyGfynHfosd7FJtVpnAMOKxha
 UtnLiHjF6UyQDEn6E4MEaZ5EaaHYRp3VWsLoiSKe8j/++MOOicCwcaekQDe4xl3ob85vXjEeLee
 RR7ClPG18w2q87T7oNWDWM2TNUWHIzmbnm+67cUgPnxE3Mk0870m6CwaRy0Lb0P2gaxOY+gMQq/
 rjeyxA+9JA7BUdFRzRVo0uKfWWPC5U/xiATonLQH13VJzXDvWn1CZ0EQ4sXnAQHHRd9Lsff7rEb
 6wg5R1EgOnUk8eCk0IQJkiFWYNVtss0QZ1Jc/Fmi2rZS6WgDdlT+ntpsUjz9vkMweOC19gHgMZJ
 O5A9JQ/s+1BZyBnN+SQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611170025

This series enables the Iris video codec on Eliza, allowing Eliza to
use hardware-accelerated video encoding and decoding.

The Iris codec on Eliza is based on the VPU3.3 hardware, sharing the
Compared to SM8650, Eliza has:
- 2 VPP pipes instead of 4, limiting the maximum supported resolution
  to 4K.

fluster result:
H.264:
Ran 76/135 tests successfully

H.265:
Ran 138/147 tests successfully

VP9:
Ran 225/305 tests successfully

Dependency:
https://lore.kernel.org/linux-arm-msm/20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com/

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
Changes in v3:
- Rebase to 7.4.
- Link to v2: https://lore.kernel.org/r/20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com

Changes in v2:
- Enable iris on eliza-evk.(Abel Vesa)
- Link to v1: https://lore.kernel.org/r/20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com

---
Wangao Wang (5):
      dt-bindings: media: qcom,sm8550-iris: Document Eliza IRIS accelerator
      media: iris: Add support for Eliza
      arm64: dts: qcom: eliza: Add iris video codec node
      arm64: dts: qcom: eliza-mtp: Enable iris video codec
      arm64: dts: qcom: eliza-evk: Enable iris video codec

 .../bindings/media/qcom,sm8550-iris.yaml           |  2 +
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi            |  4 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |  4 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 98 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 45 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 7 files changed, 158 insertions(+)
---
base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
change-id: 20260914-add_iris_for_eliza-cfa43039a976

Best regards,
-- 
Wangao Wang <wangao.wang@oss.qualcomm.com>

