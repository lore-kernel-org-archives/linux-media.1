Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FF63C5855
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330019; cv=none; b=dtHpqy15KYu4BtJbu3y+a6vWGayCnVse/JfS+G2NhocUmHz68VpNroRVtvQUe7hedjQ3/eh6B1nJIFYEVLUcO5VFC1SuzFx8bqAQDgi+qZn0hth/fs51GvqdoKmrByoo+7T/nE6a3mk1CQOIrUO+W3t7IctWfUceHcZY1JRwIzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330019; c=relaxed/simple;
	bh=f+S+lTku3sMWv1vhJi2pQtFh8vgJTbufT0NBxuZfHg0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=W6J+PEvwx4kwzcO8Yi0W+z9JGUfvviXwmGvrxCkytd/JPK3aOxjCXrWt+QZ/REAgmKMWOvDwV4rCROfeEIp/gboEYZ456oRMcPjKWahuofGnRUkVJgS6p9504/wDDRu2zj8SYDtR3Ou/ofgpxC7/WTz6LsNS/p1sLmnLLFQLDOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FzO5YQ1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=emTOOoNw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzO5YQ1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="emTOOoNw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtQR92619456
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bvnvMxhIcK/
	+trxvNdj3SRCr8OaLPB5Lxo46Tk1x2T0=; b=FzO5YQ1U51k//B8MnyloRr6QVYm
	IFSmwaOt7YofwJ3DZnO9jH9BvXMWj+ZEk7hFYf+326aKLT41H8Dhgef+wLjGbxlw
	lKfyUP5PiJojboDxVNhw4vq5Nggk9wClNctcejWzWKkhtS4Uxt19QtEdjNMkWyr2
	Tg3h7t0BetNDxZjheIMLgwM1ltL7ZZE6YdeHVRbAEbrPUjzpW6IG+QW2mf07NwQS
	kufRbTGJGORHH/vjpOZA+NeEtzYRF1/asZyqF3+VL6F1mNw2N5n9tkbajj/H4XJX
	zsGf8Tk5NXg7waRszF1HcFB10ZZlW484JGuSp8+iI7wBUA3wzncsx2JB3qw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fffagbm2g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:35 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cca5e0a0c9so160494855ad.1
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330015; x=1784934815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvnvMxhIcK/+trxvNdj3SRCr8OaLPB5Lxo46Tk1x2T0=;
        b=emTOOoNwoLzsg6cCb3ylyaeQwaKUX5evM3h1YBcL22As+VqY7PiCqBQ7ZMdtP2TmDy
         tw/hoaBUZ5EA7fY4VnF3Y8ImQ23uLZnM0wzzsSVJCBwuyZChmElDEw5Et7H4CKpjALoN
         SXFx4aR19p6CgdtbyVbyh8jtizmAuQ1SOFQnl8/2wOnfc08nniqm5q6VFah5czC064uq
         Fn2Iv9Jw2prdwUwaE4H9mL9sK9e5G0K64LhYZkjaXbQ7Y6Sx5NcwRU8Z8F5RZMDETdjk
         Vc6DDJz79tw+WI5PwPl018x0DOXXVLS+Dh9fSJOHH5uowY/iZZEOGPRiiI0q95D7Se88
         yS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330015; x=1784934815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bvnvMxhIcK/+trxvNdj3SRCr8OaLPB5Lxo46Tk1x2T0=;
        b=VWOMDxGilIAIGbf1haLmylIU9/Hc3rrTsjw0jQGbJfziFzDHqE4f/3GKTa+jIEAhg5
         J8VlLEfXE0r9a1d+cax2PM3GEIF2N/aSJlYOFglSynsdsKDquVLTHy2NZT9+vCOYFDIl
         4R0M9HqnchMG8yKUvSmO+fMT5SR6D68jx2b0wcrlKdomxmJ1c4TYex9WyMjXBqAvt8nn
         IwJsugZhbUWB64RJ1A0PHftCd29Af3GP96XpT+afA8lHdbnPuJM9PQnX0s/aJxAvZ3DV
         FkMlnojEwvx9N6jtXa+dyNWoP0WQhPKjcq6sEGxpt0pmoO9H+ArAow/FIkJEl1Qv02W3
         HGNQ==
X-Gm-Message-State: AOJu0Yx1wtxujkKhBH4UTzdwhIOerq8D+bR/uoOAqA3xjmOuhpqSTd85
	ITUZouTGX40w4F10JowkHlaWAvKUyc929W9b2I62xAcN6y/UOmC32PeCHLSfGozWr7aUYHwbKzd
	v0ES0+fQDo2qyjJiy0egi0/Itd70FK/b8Uq3V16dhkEhiYlUqg56pR8JkiyJzJ9/JDbrPIcQbyQ
	==
X-Gm-Gg: AfdE7cnWdER9qNbvgZy8tynzIxnJ/hzDZD/JRZRAehNHuu0m3aLnSVr2omKGDcChnxt
	f6+NwqvRpJoi+knTugrh9E4vEOXT3+I6NQVcjEjcgWOYAeWjbARodF4FRwBPBbpaK5RjSZ4fMu5
	VDuG3qvwki4dRJUqobkF+9KI2C+3bW2eW/iWOgCH1gFIBz3UzRc09w2t0XYyIK7qbKsSvlvtUa2
	ghRcHmhDY2NSi7Na0Y2qUQJVaQz4rNkLZ0LTYZxd+UXF4/omKfhGIy1fsvVQoZaZBcvIDj3yWY3
	97i1YWB9eKMWxzw9wb01hb0knpUiPgIgqEP89gz0rK96xRod9qNX2eGwidKoSj453mJm0g2eq5X
	i1UVKHKII7F+PxsID9ybKfBYWUbCjcm1Lz6f3sh69j75FFjPJkllv54U=
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr4923924a91.23.1784330014954;
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2692:b0:38e:79f:76ad with SMTP id 98e67ed59e1d1-38e4b52efd9mr4923900a91.23.1784330014522;
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:34 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 2/6] media: qcom: camss: Prepare CSID for C-PHY support in gen3
Date: Fri, 17 Jul 2026 16:13:27 -0700
Message-Id: <20260717231331.1229693-3-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX5Ss7cFOyz23C
 sdEAJlSR0dx+13+jT5KbnFsKTTArs7Pc4htUg2JPh2HXvO55OWokmEeFYwQWSwmsesuh0cOuzL3
 wmp+MaHIZwFfSilhI7FGlbwQi/OE87h8OqGVGDOEFRpb5pN1VLAyjGucNW4PCSGBAK0+xA2gNRY
 UV31SMTLflT58QAkibwFfg7YiSGasD7/3kjx2J8B6jWzIk0BQm/J+yG4CqupOB3up89uxumuxKe
 bXPeuDaxabBGJqI16I/Jhd7BnTdnXY022VY4H1mMLbObDQcI73xL+rE1lRzalrscfxkRjyh2IvY
 9Qjw0MPjZmJ9lghvaRYJdoLfPnrJvVpNQ/sdWoGeFVy0pC8hasPpFR7KasIHuak9yf74GQ3CfFN
 DM3ME8XsA1vhITFxH2ge0LRdBzNjY8ZiwfsiOM/XzFmLDtJczYdOrhHi/5jLHDpc7IRzfvOSM77
 SCk4HfKZrL7s9Jk0Dmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfXyAQ2fnfRK3ur
 47xQobTysWQUQspf5UjFTpFJ6En3NX0umg2O8Z3DNWHkuSWxJ2oBezKppl4KK5BjIO2aI1zxH1Z
 9dhG0hdvyolnrzJtZZtGXxX12NtDpfI=
X-Authority-Analysis: v=2.4 cv=KZfidwYD c=1 sm=1 tr=0 ts=6a5ab71f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=tNMExdcoUpRSOsAuOLEA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: JAcry4bLxJEHwDt7f0OiVnnGW6P43oWL
X-Proofpoint-ORIG-GUID: JAcry4bLxJEHwDt7f0OiVnnGW6P43oWL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 malwarescore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170238

From: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>

Program the gen3 CSID CSI2 RX PHY type field from the configured PHY
type. The RX path needs this value to distinguish C-PHY from D-PHY
input, so leaving it at the default makes C-PHY configuration
incomplete.

Co-developed-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 0fdbf75fb27d..a9c7934907a8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -66,6 +66,7 @@
 #define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
+#define		CSI2_RX_CFG0_PHY_TYPE_SEL	24
 #define		CSI2_RX_CFG0_TPG_MUX_EN		BIT(27)
 #define		CSI2_RX_CFG0_TPG_MUX_SEL	GENMASK(29, 28)
 
@@ -115,6 +116,7 @@ static void __csid_configure_rx(struct csid_device *csid,
 
 	camss = csid->camss;
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
+	val |= phy->phy_sel << CSI2_RX_CFG0_PHY_TYPE_SEL;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
 
 	if (camss->tpg && csid->tpg_linked &&
-- 
2.34.1

