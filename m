Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D647C0E3
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789984327; cv=none; b=BNs+hQSXJzLKtvcXqZV8aMHvawDxmyGVVoUGzso7ePfeUBw6lcv2iSGS5gNMVKWPRWsjJuWOawovWqEVuW6iwzt9oskNNHsEuxM+uDNAx+Ui28BuPjBUSaQD/HXdiBp5SFRwdCAo2G+uOUkvTEeOzI+MQ+yUJe9/qIAMo5qabZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789984327; c=relaxed/simple;
	bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=StI2oY2anmOoh3DqNRzpxp5kNU1/cPOF3zQeOUK3knqgpQLegf+A5YQk4hREXm/N42tiCLwl10ZY4WuEK5yUhupQE6m5OgZ4yJmVt/7DtvPRYPWhTZ7aFCBpVqNi8TmYpYiP8Y4micT9R/RCzopsCTM/hSVS203XyrJfsgf5Lbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I9Nqz17H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXYWFazt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I9Nqz17H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXYWFazt"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79k4V4143055
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=; b=I9Nqz17He3A1si7M
	R2AFVXrUMzOW7sPlb41c+hXdECCto8zFCUcH4Ps8bnLNMwTsEiC1FeEzvy5iHXsz
	nPohefKOEuZNB36FM/VHz+OW3ezvDJNEXmCnv+nUojHQHXntVMR3q2F88dhfiZ8u
	iTV1rHPFXuze790kugSMlQCKLhkd7RPbc3B+/l4jl+vj5rgP3pQPOEd5kxW+tetU
	12GV1+i6sivRrIsy8D+XCU6dI1y+07tK6hoTXPga5IbMWjMuTnJnL/nR0g62OXjf
	+eZYDE7PKxbLPXtiiDbgpnav7PiORw+ZGe62Zf2CZlxhxe1YQ1XcWZBAXnyVapp/
	oL5Qzg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtyxq8ndj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 09:52:04 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so55004455ad.2
        for <linux-media@vger.kernel.org>; Mon, 21 Sep 2026 02:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789984323; x=1790589123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=IXYWFaztSpNtUAbgWzm7c7HAjLH16Mp4lG4hAtBvelQX4B3pIk6d7lJ/+68ssATSLl
         SymHG6oWQK08dY8D2OQxzlJ8/vV2f92mg83RxVCUQzUWWPRJxDt/4gZT62L1ZSvwIiOW
         sWhY6EobUGWyh1BHkGc/+cOVlkbkic2P0EzRTuDqtqIWD4mgT5Vz5vYPXY80X5D3PFYb
         0yONZv4Kmie1QsUR3jMyogjuWRWIfFkkFeq5vbzrgmnTccTDUVcjsO+1v8vPvo5e5VAa
         MmUq5fR+6+ojol9jxb6NzR5FiQWKrIIhEcub6LNKubY3AZboWVzZxSNb+VsV6ID8LPmW
         PA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789984323; x=1790589123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsoAKwwkZH7CmZY8cZhgSvsLnJDeXkKsXCxxwIP/0lg=;
        b=yP+9DRgZHorefUkxnbjFqXqCslTEjlql4yaU6m1pnA88B5rU0cwXsXpK9L//aJMxn7
         Qa4i+T554qUbzjsZlM5j85sXAjyf4Fr8g/MP3hRJlkqqN0TbwQy8x5MPnU6eyhS9c9aL
         lEC+nf2ERnoQ6mQN/6k6o2bAj7/8TTuQuAE8pnJUWKUwvKkY1Cr/Yr0z96XCwG3H0CNq
         3ul2m6LwXULml7JVckMFvG/9I5CrmZspZUEgBvHpBMYMX/iQ/vfdRwlB9Y/0WSVFKo8B
         8MjE9MXG9cSmqwHK6T4voJ083+viSuKX5zGpjo+xSRyQ+5amRYv5OwCYNQWa+tO0HCcE
         a0Og==
X-Forwarded-Encrypted: i=1; AKwUvBzx0E3yq82/93bm8y5X5Qs/Xb1FM75zvWYRghdIUiDTioDwVodMmI5YtkqfcxTw5J4DIzL9p4zLrk73+A==@vger.kernel.org
X-Gm-Message-State: AFuF++km+j1V2y95ga6E57XlilskyHTRo4CXOjW7DnEL8dszZANeG7Mc
	SRPkRLeTBAJN8pD2RA/0y2IEXrqoxY2vpuS/qc/cFgJpKUye0zeT+zS/7yhITF0WDcpmBY0Z+p4
	FtaUCBwqh2tm8XPC2GwfHg6E/o5NCELGgPKjPJ1CQ90MqEnkJKZhfutRyZcaiJbEMiQ==
X-Gm-Gg: AYBFou1IS8PxMCmYQBaDVZpahwoXtDhX6A9MtZM9CV7unJUA3mMMUsRKg1bWEi6XQAf
	CcNxd/Bei9IxN/Vk8sTPyAbOUSgSCrZ0Xd/BeaKUdqhJi/veOqE/rwu8CP37lJIBClJ+ZQj1Y5J
	eEvkQMbLu+eigSlbBtiF9d01LDX12dY48i8V1BbgYNM/M5GWudKN1iRRSj/bfF5+1fxX9SNCFeR
	PVpHiYJ7bsoBgElskEDdFxHRlTULVzLzViBm89f/F0pCOgII7F0BSUrYxfrkS9/0Oj2Tde67rV1
	QcH3ZmMofC+pQC2zQlL+5Td+uIYeoK5GNFrTnZuIEs3WagV/mrsNsqO10FqAvENhF/VJ3Fp6+qF
	0AxF7HRbuSzTigJHdeFanv25vVXa5qB+bnBEOQIQBSZiJFL7YVVtrdCi4KPep0wAJcBh2/C/BUg
	==
X-Received: by 2002:a17:903:1a87:b0:2df:3872:f261 with SMTP id d9443c01a7336-2df387310e1mr64397405ad.33.1789984323290;
        Mon, 21 Sep 2026 02:52:03 -0700 (PDT)
X-Received: by 2002:a17:903:1a87:b0:2df:3872:f261 with SMTP id d9443c01a7336-2df387310e1mr64397095ad.33.1789984322871;
        Mon, 21 Sep 2026 02:52:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc178889dsm30523095ad.18.2026.09.21.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:52:02 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 17:51:37 +0800
Subject: [PATCH v2 4/5] arm64: dts: qcom: eliza-mtp: Enable iris video
 codec
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-add_iris_for_eliza-v2-4-5fe7be8c0230@oss.qualcomm.com>
References: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
In-Reply-To: <20260921-add_iris_for_eliza-v2-0-5fe7be8c0230@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789984298; l=835;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=OtzEBm9GVTRTWQb4gQMb5Xq+vFscZcbSu2JVYbh2zdI=;
 b=D/chGY5cdhoety7wpkQ1pRnWNNkGStMxEI/JmpkHhFbd7M9G8+zHGqc39NJ7mPtN3OnkTYc7J
 gpZLLTsbopbBE6NHV8X2WxZqV8kLPzuXaf6/P0pMATT1qs8ODW+SOSr
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: yufj0NzrkIBvU39578xSZy0mrCyajD6R
X-Proofpoint-ORIG-GUID: yufj0NzrkIBvU39578xSZy0mrCyajD6R
X-Authority-Analysis: v=2.4 cv=OtraWC/t c=1 sm=1 tr=0 ts=6ab0fe44 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=nChROllu96siAGe8wIkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX5hlIFb/lXdWo
 kyVql3HdWQCiz6DFNB/COWAxHn9kvx272nmt8hPnxqsB7iXAca9GDExsMvCgtoih0YL5oA0eADT
 7kHShFRGDqEhkONfrXQgOqpgmWVjq8jXXfG71GMpqVwjTjYj07Fp6krsQcDb5dALlKjLr/Sb+vC
 BwunD/nmdbW7BhJ1kHMqhq98HgRsXJxUXEa3BDT1y3HfLPI1b2KJ7nWqIp82pS+0X1WrTmm3fUb
 D19qrnPiinGHhtN8rvWVYI+CvzOKApEumFHANfysv7w9gLb1PW1qiqZMC9Nm8EUFQvN0zTB8ySu
 Mu+SG4n0P6PF4QmwwV+rAEQ8fv37KlCRx3W4YxgwPs8dFmTGSLaUX50iLUkD0qNzSy2ESpks0m5
 niCck6PRY08qWv9bzqAvCmYCXZ1HRuiPEQndFH7W4MN3J7drk2+Jv8V2GQFtpb620sFu4DNkmIL
 xg/crTouGwWtDtK+PlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE0MSBTYWx0ZWRfX318FQO+fY6Zu
 E3ja03pO1QhtTfGMLKo1RbdwG8/Sl4fH5GzIIRTvyblukwt1UU9MlvaeFDE4qFMLyHpl78hsIR7
 tlLjQbIkw8dqv9uJirlHEiymM5w+AGI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210141

The Eliza MTP includes the Iris video codec, but the device tree leaves
the node disabled. Mark it as okay so the video codec driver can probe
on this board.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
index ee05192adcfb9f79cba59f11001b640a8572cc91..e5a698602dfc7a2d3ad00eade40d4f91a0cee57d 100644
--- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
@@ -430,6 +430,10 @@ &gpu_zap_shader {
 	firmware-name = "qcom/eliza/gen71700_zap.mbn";
 };
 
+&iris {
+	status = "okay";
+};
+
 &mdss {
 	status = "okay";
 };

-- 
2.43.0

