Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631031;
	b=SHC5BMTZmkDXN5Xzefqr6mi8Qo73iRbEoo3t0MYczTIm2MQG3pSRvQe0QWW7BgPoHV4D
	 +5yrGSwe1J1uijqpQRCMDhw94eUXBazbcdJTBFWSEXyP50/eQdNGgI8H5ROlDmcMsloVG
	 p1B84uuk4FGCUBFDNH+vtLrjPA3Q5E1fMXiEbfiO68Yqq4KHFjadHcZdrtN2j5B3gNGhp
	 LA//mgv25U0dt0EzFJcvRzcvP5ecnQra0tyrTF2eOnlUpbU3bkKyNW5GWJORNz9hHBN/7
	 O2fC6X0gKkRSMJxhL8sqA5EcmNTCQ/hrw2YJRXsOs8o1IvJSACciUIeK3semEhoPg4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631031;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+t6otjXm2jgBilPYkJGf4Pp3998PQr1KHs2mOHvsSdw=;
	b=kXTJcPV4OAfD3p8nuD0P7SmFcSiCC+M198v3PUhbPDObntjsZPzVwoVQvKDTi6r9fxh8
	 apVl1oschWNmGBHylHv3mHmlqeFxwhGjk2i+IQ9skEfWFJGfhidhu8xaBFnoV14a4krhu
	 EM8b3w41EfQ5wO2nZQbh9ZMdsYkbfJK3gKUBp/ecw63NGcVCAGeMxZwHe5jMYBGL2lh97
	 +GO4m4fCK4fm2i6pCewGml8KF6tzTaVa+v5MTcveCOyj/MMS8LxWZOg8gKD8YfXJbFQ6U
	 ZorkiT2OSz+jtrmvJxUGwf1zlCJF6dOkQgCpjWu2bRBga4RLS6b4k1k6rp7Jth7f8rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Yc/cWp9y";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KbtEQVsC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D07606A688
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3D07606A688
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yc/cWp9y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KbtEQVsC
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQTdR454233
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+t6otjXm2jg
	BilPYkJGf4Pp3998PQr1KHs2mOHvsSdw=; b=Yc/cWp9yh3ZHaI4cYbqr2P+P2Sz
	um8BqqVvdMPzKD7M6LT7LYS6lDu2pOclb8VRDrrr9e2rHh7QzrgDmgPyzvJObxYS
	vy68cGc00RmhRzrhXnotIAQgdyFHV0+TfdSoO/HqqacW1sUkpJlzwuf2miSdsSWc
	ZhvYawHRRFhpO1HhbZqRxUR/FRWloZUlxl2N0GlTL7K++1CjreSQeibebP0P4/Op
	ZJYXuA1dcHgLHPaaY7u5urhRAoDx0yorKecUnZa8pzCDr+EbyLGVDL99ujdLrs3u
	0wYGt1UCImlbDg9CZttgiZOENAgVAsxH/co8TPl1fxCwPLeTlYrBSEgpQ2A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2t7fk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131befso888835885a.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631029; x=1796235829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+t6otjXm2jgBilPYkJGf4Pp3998PQr1KHs2mOHvsSdw=;
        b=KbtEQVsCpOkwHy+k3le0RQu7ysakprQMe1VTO/5X8fSt/wnyK71RdaHquSQw36yXUR
         3AuAMZ93R6aplisVhOJARnBwCqi71X+32u0VJ68vzg0Vaqr69eQ9o6DPvsxjOuEW9gai
         Vmb80cRb+woAaX4MOzZTHrbG7OWn2kWulDss1BsB/p2zrqbeGdIykeL7HRemr0JTWfp6
         n72ZXdX5WVI51V5hs+PAInmr9vZVSVuLkaAz2moWdtoJgQGxqBOz9fjEOzN4jFQm0c62
         3Opn47x+DbfPLG49vkLewYBLiilNAaq+WNxOvUSSSnQM0Hg2ZItffYb2a/lyBnOA1O6X
         b7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631029; x=1796235829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+t6otjXm2jgBilPYkJGf4Pp3998PQr1KHs2mOHvsSdw=;
        b=fk+770sorSAvDGuo38lrbwVN4e3bNdHFge1QEF0wTtaAltVE0iVsbFTEwlJT1AcYnP
         0o3Gs3E0gwlq4P5Au7IvKo4SmHj861bEFJdKCWdwi4+LbYClGr5guT3lMKQnXRiVnDNU
         PnEGNK+WoPfcC2mGWV+AwTsyxttIMmBZMp5NMw4cIcAe6xwIidinHmoAf9qdC/qSi8KB
         PyWWqYfr0RJDZRAE0Klk3jBAbQVQDmY8EfZamGJ3Gq+mi0m3KF6JFaUpGcxBeNfRSg2O
         +bzfQeoxssN9GLxnY6nkGLwaun7NH5w7atvUQV+beKSQHV4jpjLf9OhIEWXOUZI7u7gB
         Y3Xg==
X-Forwarded-Encrypted: i=1; AL+hErG2QxjLS5pXLZNZULrtHpVw16vDgzaFBPqKhmLxFgiUnN2EdvxoV/rz9IX1Yue5Rnljb0WsXS2XpJUDmg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+SO23D9AacUC6oSIdguvBKHFBCCf0HxlnGUToX5SkMldv/KoPT
	SfApu22GKfUfXQOWm0XP3BbJNGjxDCJzt8cS7TkJIvLtgbR0Rc1LmpYADsWLYZIubCX0QjKBgvR
	JLVLfOzmdGBYoVue12QPvTQBj1KNDyZsbBxCKX8D9s6CXeyUNtAakTjpvwjGxW3mwRA==
X-Gm-Gg: AZFdTZc2JZsBZAWweX402+knetb4RY1Do2xRIzSnPwBIwInC0VskK4Hvmaj8/5c+Hwk
	4poRfMT9C/EsGPbDPUpC7t6hun7iN6gDV8fZdrmb4GHVCpWaDmX9MblHjGD3jJVkaUjaG2CpuNI
	L6GUpH1lumkEICE5BAxVA2COaWz+Lcp8uhuloZPX+C8aymdQy0c+G11/Hvf5Cko0jecZfnnRVzm
	yVDngtajaJB56JiV2g2kbNXldryNyvGtwMY0FBbExH67PIOFIoZEsM7rN4H8jv19SYEzuAQEwuU
	FI1WpSfRNzhP2s1191sj05sfOEL+hykSibNnb3uT5aSXtAXWI/U44piX3ghpO/hH3VimoR12bHK
	3lBZQUYTt0E6dap6JEkSgvMYHXrr/A2GsTL5XPdzHceLe5JDBhlz5oT8FeNN5TIp5w5IBh3oh8e
	pQnKZT
X-Received: by 2002:a05:620a:600d:b0:93f:2635:b6f1 with SMTP id af79cd13be357-949ba7e3ac6mr2855408885a.8.1795631028869;
        Wed, 25 Nov 2026 10:23:48 -0800 (PST)
X-Received: by 2002:a05:620a:600d:b0:93f:2635:b6f1 with SMTP id af79cd13be357-949ba7e3ac6mr2855404585a.8.1795631028320;
        Wed, 25 Nov 2026 10:23:48 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:47 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 04/12] media: qcom: camss: Add streams API support for CSIPHY
Date: Wed, 25 Nov 2026 20:23:18 +0200
Message-Id: <20261125182326.2767771-5-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXy3SeNQNVvEv0
 sZup7UzL83qXjTlW54H8rXjNje4EXbOIwI2u+/RquxRjiuAlLpHlYyHQR/huIzamg7ABbXCU9Cw
 DS1tLdrRxpZyc1zrDHF/DwG9XgG1v/w=
X-Proofpoint-GUID: Cb3-ySMRp6ZtkwbvnlOQvVhTzLXAnOT2
X-Proofpoint-ORIG-GUID: Cb3-ySMRp6ZtkwbvnlOQvVhTzLXAnOT2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX27qrhEKRk4hQ
 T2rmMMF7u9l8Vnq6YnjPtb2aTHclqMhuz0z+9JolXoERZq08T5+CYOTWXPUtnjgY//9+r//Httx
 yRIzmItCjnhmrtu4EGm2yPoEVUEoORLarN/1BQHDbg5JtStUok4nVZNEto7IEaAJeMN/DC2+Dro
 uADuQ0UtZaFN7+0wNDlNv4V0uca9AwoWEs8Rdsusp+dMWwwlNuv13Cww+gpKnUv8Iry+Pxvyskq
 t17RWOxenWlNf5hhS3YTwU5aHaIXuTE3Uj54UlYUzgWLbqaGe5u1iFNx49+Tu7NfQ2j5zmemsYP
 R5n6/lj+KIJMK68dARsCM+ugNhWwOFccVFo2S5N9yx9HBIBuuwGsGfsY/4Ib3Gs3yyC95D3Z+eu
 PoY2VzWF0FjJ1hCtMTVQxELJ/MNN8R+ey1XZ5IIZ5NFf8WPMEYbwEPDy7xGh9bRLS68vYrhtUcp
 jsJuKo1Q6MD0zkgazGg==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b0727b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ZovgdgjKAAAA:8
 a=EUspDBNiAAAA:8 a=Z-lWuImNtW0lsCYLBDgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250073

Implement the V4L2 subdev streams API (enable_streams/disable_streams,
set_routing) on CSIPHY, selected per SoC via the new streams_enable
field on struct camss_resources.

The shared D-PHY lanes are enabled once, on the transition to an
active state, and torn down once no sink stream is referenced by any
source pad any more. CSIPHY has no per-VC demux, so every route must
pass a sink stream straight through as the same source stream; a
multi-VC sensor is supported by userspace adding further routes via
.set_routing.

CSIPHY can be wired through either the legacy s_power/s_stream path
or the generic PHY framework (camss->legacy_phy); the streams-API
pad ops are shared between both, with enable/disable dispatching to
the matching backend.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 249 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 2 files changed, 244 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..41df8f1dad83 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -421,6 +421,129 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+/*
+ * csiphy_streams_set_stream - Enable/disable streaming on CSIPHY module
+ * @sd: CSIPHY V4L2 subdevice
+ * @enable: Requested streaming state
+ *
+ * Dispatches to the legacy or generic PHY depending on how this
+ * CSIPHY instance is wired, mirroring msm_csiphy_register_entity().
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_streams_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+
+	if (csiphy->camss->legacy_phy)
+		return csiphy_set_stream_legacy(sd, enable);
+
+	return csiphy_set_stream(sd, enable);
+}
+
+/*
+ * csiphy_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * The shared PHY lanes are enabled once, on the transition to an active
+ * state. The sink stream(s) are propagated upstream to the sensor only for
+ * streams which are inactive, so a stream that's already running is never
+ * redundantly re-propagated.
+ *
+ * CSIPHY is only ever linked to a single entity on its source pad, and that
+ * entity is responsible for only enabling a stream on this pad while it
+ * itself still needs it, so no cross-consumer refcounting is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_pad_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	u64 sink_streams, propagate_mask;
+	int ret;
+
+	if (!csiphy->enabled_streams) {
+		ret = csiphy_streams_set_stream(sd, 1);
+		if (ret)
+			return ret;
+	}
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
+						       &streams_mask);
+
+	propagate_mask = sink_streams & ~csiphy->enabled_streams;
+	if (propagate_mask) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, propagate_mask);
+		if (ret) {
+			if (!csiphy->enabled_streams)
+				csiphy_streams_set_stream(sd, 0);
+
+			return ret;
+		}
+	}
+	csiphy->enabled_streams |= sink_streams;
+
+	return 0;
+}
+
+/*
+ * csiphy_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * The shared PHY lanes, and the propagation to the sensor, are only torn
+ * down once no sink stream is referenced by any source pad any more.
+ *
+ * CSIPHY is only ever linked to a single entity on its source pad, and that
+ * entity is responsible for only disabling a stream on this pad once it no
+ * longer needs it, so no cross-consumer refcounting is needed here.
+ * If error occurs propagate the error but continue to disable the streams
+ * on best effort.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_pad_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	u64 sink_streams;
+	int ret = 0;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
+						       &streams_mask);
+
+	csiphy->enabled_streams &= ~sink_streams;
+
+	if (!csiphy->enabled_streams)
+		ret = csiphy_streams_set_stream(sd, 0);
+
+	if (sink_streams) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		int remote_ret;
+
+		remote_ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
+							 sink_streams);
+		if (!ret)
+			ret = remote_ret;
+	}
+
+	return ret;
+}
+
 /*
  * __csiphy_get_format - Get pointer to format structure
  * @csiphy: CSIPHY device
@@ -881,6 +1004,71 @@ static int csiphy_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int csiphy_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = MSM_CSIPHY_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = MSM_CSIPHY_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	/*
+	 * CSIPHY has no per-VC demux, so every sink stream (VC) a
+	 * multi-stream sensor may drive must pass straight through as the
+	 * same source stream, or downstream link validation (e.g. against
+	 * CSID's multi-pad sink) will flag it as dangling. A multi-VC sensor
+	 * is supported by userspace adding further routes via .set_routing;
+	 * this default covers the common single-VC case.
+	 */
+	return v4l2_subdev_set_routing(sd, state, &routing);
+}
+
+/*
+ * csiphy_set_routing - Set routing for the CSIPHY subdev
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @which: Type of format state (V4L2_SUBDEV_FORMAT_ACTIVE or TRY)
+ * @routing: Routing table to set
+ *
+ * CSIPHY has no per-VC demux, so every route must pass a sink stream
+ * straight through as the same source stream.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	unsigned int i;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csiphy->enabled_streams)
+		return -EBUSY;
+
+	for (i = 0; i < routing->num_routes; i++)
+		if (routing->routes[i].sink_stream != routing->routes[i].source_stream)
+			return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
+					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
 static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy = {
 	.s_power = csiphy_set_power_legacy,
 };
@@ -911,10 +1099,40 @@ static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
 	.pad = &csiphy_pad_ops,
 };
 
+static const struct v4l2_subdev_pad_ops csiphy_streams_pad_ops = {
+	.enum_mbus_code = csiphy_enum_mbus_code,
+	.enum_frame_size = csiphy_enum_frame_size,
+	.get_fmt = csiphy_get_format,
+	.set_fmt = csiphy_set_format,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing = csiphy_set_routing,
+	.enable_streams = csiphy_pad_enable_streams,
+	.disable_streams = csiphy_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops csiphy_streams_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops_legacy = {
+	.core = &csiphy_core_ops_legacy,
+	.pad = &csiphy_streams_pad_ops,
+	.video = &csiphy_streams_video_ops,
+};
+
+static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops = {
+	.pad = &csiphy_streams_pad_ops,
+	.video = &csiphy_streams_video_ops,
+};
+
 static const struct v4l2_subdev_internal_ops csiphy_v4l2_internal_ops = {
 	.open = csiphy_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops csiphy_streams_internal_ops = {
+	.init_state = csiphy_init_state,
+};
+
 static const struct media_entity_operations csiphy_media_ops = {
 	.link_setup = csiphy_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -934,15 +1152,21 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	struct media_pad *pads = csiphy->pads;
 	struct camss *camss = csiphy->camss;
 	struct device *dev = camss->dev;
+	bool streams_api = camss->res->streams_enable;
 	int ret;
 
-	if (camss->legacy_phy)
-		v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
+	if (streams_api)
+		v4l2_subdev_init(sd, camss->legacy_phy ? &csiphy_streams_v4l2_ops_legacy
+							: &csiphy_streams_v4l2_ops);
 	else
-		v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+		v4l2_subdev_init(sd, camss->legacy_phy ? &csiphy_v4l2_ops_legacy
+							: &csiphy_v4l2_ops);
 
-	sd->internal_ops = &csiphy_v4l2_internal_ops;
+	sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
+					: &csiphy_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSIPHY_NAME, csiphy->id);
 	sd->grp_id = CSIPHY_GRP_ID;
@@ -965,10 +1189,18 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 		return ret;
 	}
 
+	if (streams_api) {
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_entity_err;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		goto media_entity_err;
+		goto subdev_cleanup_err;
 	}
 
 	if (!IS_ERR(csiphy->phy)) {
@@ -976,12 +1208,15 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 		if (ret) {
 			dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
 			v4l2_device_unregister_subdev(sd);
-			goto media_entity_err;
+			goto subdev_cleanup_err;
 		}
 	}
 
 	return 0;
 
+subdev_cleanup_err:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
 media_entity_err:
 	media_entity_cleanup(&sd->entity);
 	return ret;
@@ -996,5 +1231,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 	if (!IS_ERR(csiphy->phy))
 		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
+	if (csiphy->camss->res->streams_enable)
+		v4l2_subdev_cleanup(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1c..cd15369d132e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -118,6 +118,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	u64 enabled_streams;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

