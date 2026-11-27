Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795756676;
	b=SulMjH1LhYp7vzuhzb1uJKyP/8sXgZ8n7pp4Y7lyRhhLOjlwgu5Hkxm5MHp/TgOySGhn
	 A7DAaR0zo9OzWwLkVIpzbVPs9vFen/N1OCC5Vlc+tsdjkm9tX0Lu8eR1QHSTr2Gdyneo+
	 4aNwG5ErXpHfh3aeE1lbX2OQMaMNPiH3YErV1v3uAkfK16Hz9ZOi8huwx3i7fptbs3gom
	 76m/sq/3/kfi/0sbHI2bFYEMGWASonytPI4rKDGkiQtLiELq/FbLT3+bcS7GKpZwp+yAh
	 1k/lAChJ7cPCfYRLxiOB2ZtCC+BR4knfOz9sqIU18jhDSxjv2md9I5BCbs8UQMMqU1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795756676;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yIWmRd44pxSJZoqqDDYPZZjasoO/WlBoNz/mYuxAQJk=;
	b=lhUUJeUWpDXo6RKCNYy4jw9k5rIEw8AtCMB/q+LZls7bEEeySaQjooPFH9VjphzlJ/Ek
	 ImV7HDi1o5PCJkblKMgqmVBFRUvlES0MzYgQrsld24ChgKz+/Z0tOxG/FAbbbl5Gu8OJM
	 3kGvunyWfVenvyQJfvTShEsPnp6YEOoBa5voEiZhVnjbC6Sxb8W5eiW2I/VwPJ1otw/C4
	 B5eTQNMmHP4DpwQ13Wd9MZ9sgBgdaIbln9MHzTweiHj96NuVyEyMDFMDXe15Weky0jS/e
	 SnpiAFE+Rilxq8qtXmOftuV7Mvgh23aysjoaiqKfyTHFska5b3WNZc4rFfywGx56O6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYCSNqaR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCpbwcHT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEEC606A31E
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAEEC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hYCSNqaR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HCpbwcHT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQJwYSk161843
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=yIWmRd44pxSJZoqqDDYPZZ
	jasoO/WlBoNz/mYuxAQJk=; b=hYCSNqaRnQmQ6oxWX9A4AYhbWnXBJfG39uBtL/
	kjd/w6e23Jrjsxv/TuBZ2K9NbZhXFU8lexrAm/1tTAZDzEoxjPt4AnZsk0wkys/Q
	Svcgl23yuRnujbn9DQk0W30a56x//p2AKlvoHSSq1LsE3Pqh5NCkXt1Ww1+gDOfU
	hTEKFCXJDgWSlEnpLj0zU9T4ZiMGBNcs7ENNABQkL/4jXTagLtaAXu50OYv9BCLY
	YVPz3dbFabcBtm3RZYSRVQdJa35NiIWIk96wYG2v2SXRWbaxL3e5c3sLTXBQ4Yub
	If9KlfGH2di8KH99qy3YL1iozgqU6mKMQ2/mbwIucgVp30Tw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6h7gbhe3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 05:17:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso1029974785a.3
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 21:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795756674; x=1796361474; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yIWmRd44pxSJZoqqDDYPZZjasoO/WlBoNz/mYuxAQJk=;
        b=HCpbwcHTyvZzLfj5tSQprGUjUnXwojn5W62nvKdLN/thQ5KqksxE9MToQ6C83nBa4E
         CKj4+5hj2V6V5yQJ7gR4fdrXRRpP9SAxKr6+UMT5trhS83aHDYXy7ZoBfgX3ZmrkIuoY
         h0uZ6THZO39caOTM1t+QVx/7vwoixfwcmV1DV5S1Nyvft00PCE6/IT/p9afDjPM6oFLa
         uE7nO2U5kUmQOA2Pv1cecwHufoRJQ2+kOPoJROfa1qoceuuFllcfw9yPqioYaIzak1M5
         F6CeVSPCc9icJ1B1khz2Uhi4vEs/1VbL54AKQn1XrceghWAABJD9xWYjJUJRdxStoCuT
         xnDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795756674; x=1796361474;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yIWmRd44pxSJZoqqDDYPZZjasoO/WlBoNz/mYuxAQJk=;
        b=QT7DZya6M2P0tTFx2M9S62lRy90G8HUOwrIyXD3sAXWOjBURpN6Wyxzvcqgdu0zXtY
         f/JuWIg0eK8rQm3BrHcz2hr4degqzVduBlRLnttN8nWslhEDbHehxuFTh+PT6nWNg/oZ
         Pm5AXQMmsIO0JLwUSJZxlumrwcpfrM+PY7+TGfHK7zpTXMGwIcq+ZkTDzSBOpWF/AQWM
         l5UzPxo1VNfTKjphMp2dEKxiP6rnZwINs2oH1gn6Gk6QKIYVCzciMZon0h583EnQJFBE
         RRu5wElBcVVPzQWlHuaNsrFs2pN20vb1tHH56mcht11+kLJAJtH89JYe7uqn/Q1Fq/Z+
         h7fA==
X-Gm-Message-State: APuU4Z8VU0m0UOB55vqWz2SoC6MKDLlUfSthe+BMFGbaYMabN5EUaV7B
	zVU31XYQkyYWxZLAN0DQguPikYKl8ef2BGKhfxwCPjsVnU9KgDMHlVAAbC3hox5cSC4rOvx3MYF
	sOcvFMftVOxz4pUTV3cNT8fcyHyA7NcS65iqreenTt7NdOSWZyRZVjXbD5yBd1OHeMw==
X-Gm-Gg: AZFdTZeO6KIO1VrSoDsNUshn2VKindDyv21I59VyPrOlk1mer2lsZVDiD07h7ERx0v1
	1cEk6V0lRcAmNZHfCw/5bGXsIybp2I21UJim0mPn71m3La7PFkthQR7PWh+i9fMVi+Z7aMWuM/R
	ocJsruE3w7PPZC56t+d6A/WIr8Zm+70K7b+qywCFFq+aidsz6tZIpuKAl2xkdMaz1Ev1F6iuz+5
	lHU9yef51RpBiTr8A64Yujkci5ueKZTPX7gGERkkH+tCfO6/AwTNEuo6nM5iV+V3Df+CY4oL4nN
	H0ykaV9gI84bK6K4HBOFEh8pEvuoEeKqMmuVt36C+EAbQ/hxVBcirgcTwTBJomvQQFMli383YX+
	GFn0bLVl92pdE8LDm85/r5JD76RIL9sU0umE2ck1zACHrn96XnTi0mEjPkRstTiXotEFj1TsvCS
	wywlKIO5pljBvVNNX56X4I9eBVCci/JD1XtfJozS8cNg==
X-Received: by 2002:a05:620a:6f0a:b0:949:7710:37ef with SMTP id af79cd13be357-949baa0f7f0mr3738381285a.61.1795756673619;
        Thu, 26 Nov 2026 21:17:53 -0800 (PST)
X-Received: by 2002:a05:620a:6f0a:b0:949:7710:37ef with SMTP id af79cd13be357-949baa0f7f0mr3738377885a.61.1795756673077;
        Thu, 26 Nov 2026 21:17:53 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm1725278485a.7.2026.11.26.21.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 21:17:52 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 13:17:42 +0800
Subject: [PATCH v7] media: qcom: camss: Add support for X1P42100 CAMSS
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
Message-Id: <20261127-purwa_camss-v7-1-b28b72e05214@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHUSCWsC/3XQ207DMAwG4FeZck2mOM2pu+I9EEJp4rJIdN2St
 YCmvjvuQJRK9CbS78hf7NxYwZywsMPuxjKOqaT+RME+7Fg4+tMr8hQpMymkEUrU/Dzkd/8SfFc
 KV1ZbZxtnERSjjnPGNn3ctafn75zxMhB6XYrHVK59/ry/OMJc/cFBrPARuOCIMbQm1tEhPval7
 C+Dfwt91+3pYDM3yoXQAGtCEiHpwvmmBmnCBqF+CRDCrQlFRBNagKaVwWixQei/xPqXRk2EdgG
 qGGxQUW4QZiFo1jVhZoKWsB595ar/iGmavgAB1hEizgEAAA==
X-Change-ID: 20260409-purwa_camss-475787b87e14
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795756669; l=10578;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=vBkc3xHpvUrB/gMXuUWSTEyJ8Yz4oFONkBXbxzQOidk=;
 b=9EFIHn342I6QAsdl2C4dsBiUKkyTeeFjpKv9jO79mg3H9JCZmfvZL0TCAZLyJR8MLK2EbX3vY
 Hm35FUD35iQAVfzW5vHYC6PcYqEcANixY7L/bLJ5TNreAIyzb5MD6s3
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: VpFHgLPVvLFlkPW2D6K0Yy_lTujYfFWX
X-Proofpoint-GUID: VpFHgLPVvLFlkPW2D6K0Yy_lTujYfFWX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyMCBTYWx0ZWRfX2Islgpks0GeV
 bLPWSp7gac2p6Fl/UDGfQ1xVbyXe72BzcjyODciJxvi1QPXd1chLlF7GwpsHdoRg3+/y56+EY0E
 YCt3ZEvkNConv7ezPHowRJ3nSCkg/MWpXynWc/ok8NuGsCzyN9goQdpi/7j44Pbw7f44VJExlBD
 UY+FLJSxLJzU9FaDQmVgf8tgqCMQM+6IEprpL2cmSNrk+LLIiHT11Uz6mlbriI6oiNFt45UAThC
 Aqd3cm3MNK3bmjl30j50jeP+yXpQsSQ91h6GzG4aMVvKe6sqXOKGBzzy9fk04LB4UzcM03zHBPV
 EROTmbS6rhfMkS7KPAnzaJ9bpqx6q0nMoeFYpFXHPHxejZhpRKoOjVIzuCuNYFnIObWm4LRYMjL
 +valvkcr3gCoCuihFzjX72YWS1YRvmRaO76ShT4sx1w97OwfUA3rc7DnPsgdxh3+GgO+YQ3n1k+
 JzKrDdtbfZq5gNO7zsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyMCBTYWx0ZWRfX4DIsmGRPdOou
 fQbGwWZ7KEOdAI3cyRjatx4v+0OQG409/ZWd5drZXKuLvcfxOOseCT8klJcGDL1Eg1+A54y2eR9
 B9ePVRMJtuZI7FsQtNJ5A91qADxqx4Y=
X-Authority-Analysis: v=2.4 cv=L4GI0OT8 c=1 sm=1 tr=0 ts=6b091282 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=j7ZsQ5hsxSTuYjeljD0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270020

Add CAMSS support for the Qualcomm X1P42100 (Purwa) SoC.

The X1P42100 CAMSS is a cut-down variant of the X1E80100 (Hamoa)
CAMSS. Compared to X1E80100 it has:
- 2 x CSIPHY (CSIPHY0 and CSIPHY4) instead of 4
- 1 x IFE instead of 2
- only the ahb and hf_mnoc interconnect paths

The CSID, CSID Lite, IFE Lite and TPG blocks are the same as on
X1E80100, so reuse the existing CSID/VFE 680 ops and the X1E80100
TPG and CSID wrapper resources.

CSID1 and CSID2 have no corresponding IFE on X1P42100, so they cannot
drive any write master. Leave them out of the CSID resources, keeping
the 1:1 CSID to VFE mapping CSID0->IFE0, CSID_LITE0->IFE_LITE0 and
CSID_LITE1->IFE_LITE1.

The CSIPHYs are handled through the PHY API, so no CSIPHY
resources other than the lane format are needed.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
This patch adds camss support for purwa platform.

This series depends on:
https://lore.kernel.org/all/20261127-camss-routing-fixes-v2-0-b7152f0af49a@kernel.org/
---
Changes in v7:
- Remove the duplicate patches and rebase on Bryan's changes.
- Base on bryan/camss-next
- Link to v6: https://lore.kernel.org/r/20261126-purwa_camss-v6-0-5ab97aea3832@oss.qualcomm.com

Changes in v6:
- Rebase on bryan/camss-next; drop the dt-bindings patch, already applied.
- Include Jesse's "x1e80100: Use the lite clocks for the lite CSIDs" as a
  dependency, already reviewed:
  https://lore.kernel.org/all/bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com/
- New patch: use the HW CSID index for the CSID 680 wrapper IO path
  config, the lite CSIDs program the wrong register since CSID2 was
  dropped from the X1E80100 resources.
- X1P42100: set the CSID hw_id, and use the vfe_lite_csid and
  vfe_lite_cphy_rx clocks for the lite CSIDs.
- X1P42100: align the clock rates with the X1P42100 camcc frequency tables.
- Link to v5: https://lore.kernel.org/r/20261009-purwa_camss-v5-0-58c13dc7c4d2@oss.qualcomm.com

Changes in v5:
- Set line_num of IFE0 to 3. -- Bryan
- Introduce CAMSS_CSIPHY_RES_PHY_API() to describe PHY API based csiphy
  resources and use it for X1P42100. -- Bryan
- Link to v4: https://lore.kernel.org/r/20261008-purwa_camss-v4-0-bcf11bf2c650@oss.qualcomm.com

Changes in v4:
- Collect R-b tags from Bryan and Krzysztof on dt-bindings patch.
- Rebase on linux-next and add Bryan`s vfe patch.
- Link to v3: https://lore.kernel.org/all/20260930-purwa_camss-v3-0-0fe2a5b11208@oss.qualcomm.com

Changes in v3:
- Rebased on the latest CSIPHY code.
- Link to v2: https://lore.kernel.org/r/20260511-purwa_camss-v2-0-22608ab9126c@oss.qualcomm.com

Changes in v2:
- Based on the old version of csiphy.
- Remove Src clk. -- Bryan
- Extend the register block of the VFE. -- Bryan
- Add comments for IOMMU. -- Bryan
- Link to v1: https://lore.kernel.org/r/20260410-purwa_camss-v1-0-eedcf6d9d8ee@oss.qualcomm.com
---
 drivers/media/platform/qcom/camss/camss-vfe.c |   1 +
 drivers/media/platform/qcom/camss/camss.c     | 176 ++++++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 3 files changed, 178 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 7183081e357846bbdbbc2c6bdf6e134d723e00da..c684de629e3a4685d4ff04b24db86c12f962b50c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -2054,6 +2054,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
+	case CAMSS_X1P42100:
 		ret = 16;
 		break;
 	default:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 86bb1df811ea0e96357d18dae0a5bdce6507fb15..0404f95a35fe659c6f9d945ff5bd32ce749b0991 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -36,6 +36,13 @@
 /* Top-level CAMSS version register */
 #define CAMSS_HW_VERSION		0x0
 
+/* CSIPHY resources for PHY API devices, only id and formats are needed */
+#define CAMSS_CSIPHY_RES_PHY_API(_id, _formats)		\
+	.csiphy = {					\
+		.id = (_id),				\
+		.formats = (_formats),			\
+	}
+
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
 static const struct camss_subdev_resources csid_res_kaanapali[] = {
@@ -4859,6 +4866,158 @@ static const struct resources_wrapper csid_wrapper_res_x1e80100 = {
 	.reg = "csid_wrapper",
 };
 
+static const struct camss_subdev_resources csiphy_res_x1p42100[] = {
+	/* CSIPHY0 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(0, &csiphy_formats_sdm845),
+	},
+	/* CSIPHY4 */
+	{
+		CAMSS_CSIPHY_RES_PHY_API(4, &csiphy_formats_sdm845),
+	},
+};
+
+static const struct camss_subdev_resources csid_res_x1p42100[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "csid", "csid_csiphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.id = 0,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		},
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.id = 3,
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx" },
+		.clock_rate = { { 0 },
+				{ 80000000 },
+				{ 100000000, 200000000, 300000000, 400000000 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.id = 4,
+			.is_lite = true,
+			.hw_ops = &csid_ops_680,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_x1p42100[] = {
+	/* IFE0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "cpas_fast_ahb",
+			   "cpas_vfe0", "vfe0_fast_ahb", "vfe0" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 432000000, 594000000, 675000000, 727000000 }, },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_0 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+	/* IFE_LITE_1 */
+	{
+		.regulators = {},
+		.clock = { "camnoc_rt_axi", "cpas_ahb", "vfe_lite_ahb",
+			   "cpas_vfe_lite", "vfe_lite", "vfe_lite_csid" },
+		.clock_rate = { { 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 480000000 },
+				{ 400000000, 480000000 }, },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.is_lite = true,
+			.line_num = 4,
+			.hw_ops = &vfe_ops_680,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		},
+	},
+};
+
+static const struct resources_icc icc_res_x1p42100[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
 /*
  * camss_add_clock_margin - Add margin to clock frequency rate
  * @rate: Clock frequency rate
@@ -6264,6 +6423,22 @@ static const struct camss_resources x1e80100_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_x1e80100),
 };
 
+static const struct camss_resources x1p42100_resources = {
+	.version = CAMSS_X1P42100,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_x1p42100,
+	.tpg_res = tpg_res_x1e80100,
+	.csid_res = csid_res_x1p42100,
+	.vfe_res = vfe_res_x1p42100,
+	.csid_wrapper_res = &csid_wrapper_res_x1e80100,
+	.icc_res = icc_res_x1p42100,
+	.icc_path_num = ARRAY_SIZE(icc_res_x1p42100),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_x1p42100),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
+	.csid_num = ARRAY_SIZE(csid_res_x1p42100),
+	.vfe_num = ARRAY_SIZE(vfe_res_x1p42100),
+};
+
 static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
@@ -6284,6 +6459,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
 	{ .compatible = "qcom,x1e80100-camss", .data = &x1e80100_resources },
+	{ .compatible = "qcom,x1p42100-camss", .data = &x1p42100_resources },
 	{ .compatible = "qcom,glymur-camss", .data = &x1e80100_resources },
 	{ }
 };
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..734023839abe9ec6a89b1a5c2a0bd5e545846c0e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -99,6 +99,7 @@ enum camss_version {
 	CAMSS_8775P,
 	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
+	CAMSS_X1P42100,
 };
 
 enum icc_count {

---
base-commit: 8d7367eeff00296ca3d780f8a43294539b9c6c65
change-id: 20260409-purwa_camss-475787b87e14

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

