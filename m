Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=nsvfA6byZUP2UKDH6rSwKoR8jDuPX7NTuM7iNYL+mfhdH3D5K1kpXmCGIMI5bv6VUJla
	 lswxR42NA5bHwwhYH/3QHZYcInlU5waOSLgDtECGIDtcdPVZAKnLwk7zKwS9NIXu7mLWP
	 1CDwLDHrGV5zzRNNcnWeHX9i/RDDzqTrZ+KgLX24knGWxweSn608MRW01qyF9DQQeCipH
	 2WNxPTI5INDpP3Rr89YbWgDqMDno0lapuRNe18jtBoHPhSZk16cteNUdJT4dPIFo351f5
	 Ylic4zjKqdx1QXBbOhxzHSHeqqtMEG/51Ura7y/Db6RQ/vlUHOysZfwDbOU8ESP30hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
	b=2nFCqA3rO6+yyqOVxOThHMRPO+Xb+NFWlTixqpd0gOUbPpb1eipa4PQnCaN+r6cGV6HH
	 +WxX9ZSjKfW0rP0ipbdwjZHbicG3v5EFFCdmz18901Hj4jhBHwV7BD5J4ZKXtVPOYaXxi
	 2AeP77a+DzlXcMCzTix592pAAm+2maIobOjD9rUXpeMDQNltYTwMDYKh5+iW5N55+C6eA
	 W8Z7CVpPOuX+jY7IClcsxbitOaqIFTaL3GH3/v5F+pEcyXynW9x+O4zwwCaucZTsl+YNY
	 egtZyWk/lazusQ7xU0Tpi6lLXmTVSfFfeC0+kUKCHWJjGGYfVpqEsQjnGaLJjytWJYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdfVQYu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQTsNpIj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEC6606A33C
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAEC6606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kfdfVQYu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EQTsNpIj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68iJ31617350
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=; b=kfdfVQYubP690LMM
	F3W7D6P6Jx5H6uGV2a3FkvZl9MIT5EbOL+uQEnDzn+zJC9ObIbvsMyTB4XsOlQLY
	Vljb1C1q21o2isKDgKInpKE5/bDxsCovHnPnmS3XE1eYtwEgqQCLIfPNN5GT5n4V
	PIRo2tDIsZuK1UDb9wP7dIkn0QzrIAPFAVz0a8d3ih1jjN2fb1gUapnVo6CZbZNv
	4RlDDCV6qMqsmWqwKVADpoMF4OCBBRUsp2PnjGpWZTbOWBSA3rUAzhHUagHaup0m
	gHOf7EUBwkQi115hUnul2cC1J1Gvi9NWajRgYVJi/moD0e9P8vGEByjqNf+D9NK6
	emA0MA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5effudu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9496ff065bcso755657585a.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 00:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595925; x=1796200725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
        b=EQTsNpIjOgL9Hanj9vFfi1kL0Y1PXhugpRW03zRLOCoh5s5EVq4IYw2rMxwwd+pdxK
         aHsVOUbr6/RjrCiXkqJ/SQhA8Os2qlUrGOY16hm0j7Rs8nE+gj3kBovzfoaot0GwDTyf
         dSOaPzQgjeSYxBRsg53YSezKedrCwG4WBWcDx5RTJ4EjCUgwgIEHJpRLYN0l9HO+lpQx
         BpB+FmIAftg5N7Re2XvnUQPp3AVLdcQAW+6lRNypcPkLxg57U7p2RiOUNg1M/KU2AdMe
         94F3O1WkUrc6l9qFKSgw/7Nakyg7glSgwpuCC6y0NL/3ebkAKJ7iN7m22G8yTyw3C5eu
         36nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595925; x=1796200725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pgd7b1HoZSWyWQpeJDpOm1XnK7grgpjGXb2iS6jEpXs=;
        b=wWmwY/ulas7GWSemOtYouCr+lAJXIT3Ymz3KlG2yDZS8PLAvXK8GMKt5o35Afe4Sv5
         dSOatvhzVzfAp8wg6lg6kb+yFY8a/5wb1HgXYRIKPN3/K+i7PcSBGBkUFdjvLplO+qcs
         Z/1gfQXvhbSI6oS6vK6iSaiCzHdUQG8ILhA4Lte/HNnqZHc7oLh/Y71ELABQ/RL1wvvK
         jDnfdag65ceZuDpKtqw1eDg7vRZBYu+UxQQZEndzboSXkSs2J7CWreVVDAjIdEcm3TQG
         CxHsr7O904Y6SBLwWTFHTrbQhYPew+aPn7ueVmvlw731LsXHztj7hZ3dePQvaqwvCzxK
         Gp/g==
X-Gm-Message-State: APuU4Z+QUlYr2XyFoG1kYisqhZDgEvNSlWaTIdBnQ+ksDZTH6bU6Rat5
	unf/PzkhmeQuW5aBQRRG7scEvbJ4A4ZOfIH1ZQfbjWuz3xkhfBImPg/3xPEqqLtQkafOJ0k71Dy
	jNhCssK5ICIxa0qEr3BAmFd/auVdEds6y+yTGi9PQ1ziQ/qyx3yZQ40CK8jAQz5Hbhyn/xXtYZE
	Bf
X-Gm-Gg: AZFdTZfPmW/uqoYSAzsX8zPTjeMrqQPQtSpFvMCxhILjKkKTSRRJHwdSwdN1CYs21zu
	zTKiFBfDdSe6YVFIAOLgrwsEQ/D9xoehL2V28PrA6JadtWNuv1uuKznFuwgsgK+8Gl/i9jlqaUG
	1WMVJLPTcUsVS2si+E+Q8vAWEcdsbDGeEL5w72+s6xUF1l3WxpNNfCCJe1wmHbG3y8J0GVkxz+J
	aa8Tn0I/QNbIaFFXq9MzDuZHukc+ST7pX7HujeXDtUeNBpfIR2Jyg1ab6bZo3SDZBf0zeADSHq4
	HYNkqI7u6shF9WodRSDhz3iCKZg/G1Am6mmLkz2iV3B8BNio0uldKM1ew8p/KxmHTQ/PH0nIDDA
	UMisIeEA7mx24OqKUbsMb4g/zPKWmpDdBp+2S1As3hIDGplS67kDPSlBPuw5+s/rqatWMbW0esz
	kSo2r4cLLozo5984jlyyIdy2hJYqDfALzrflKIBMgp4ot25Ww+zZpfmEyKoX8K033I4ys1XZiRK
	FtbcXFMUea55NnwiO7nduLSxis4
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2965154985a.42.1795595925358;
        Wed, 25 Nov 2026 00:38:45 -0800 (PST)
X-Received: by 2002:a05:620a:2949:b0:949:673f:72ca with SMTP id af79cd13be357-949ba9b4a76mr2965152185a.42.1795595924856;
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 09:38:40 +0100
Subject: [PATCH v2 1/2] media: qcom: camss: Latch buffer addresses through
 a single helper
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
Message-Id: <20261125-tfe-fix-irq-v2-1-29dfa0955927@oss.qualcomm.com>
References: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
In-Reply-To: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=eo5KXYpX c=1 sm=1 tr=0 ts=6b069e96 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=d6NsCnqxkaT3_V1LjFAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXy0vE7J92oaI9
 bzSoe51qzQ5e/cNBQ4uw/MHmppzoV23eb16FcD9PZoDWn39rnyE/F78vaU/YAgSbxlWk7Oy0aah
 DiBv8K5CSzXvjOgqd/ajpmpPMMs1ruK2sIAPJlshonQZWIbAeE5tTW7UlWg1jq18hvWLSWYDZKH
 YekRoVWTrBURGBqctok68+WbZsvycWZ4K9cdruknFa8f4JZTzoh+yLvelpJysOG59owOXmLabMw
 knAY2i/uIesciuIhdZtZH7GpY7Rzv3tXdU1kxNK4f9DFvoujbMGuOhPWhztG9pl//703Oe+Rrr/
 5ufkRy87RHo+O0oNW1Rna9h0dwf3Yd/Rt5k3M5XUNKmy+jCIzWzk2CwhvPE9x6iTuwboUV1KGcd
 dfeRq+oRTAb2bF/0KYmHypZqRlG7hB+hrqeBRdEKGs/jiYDSm4LZj9V4mKMXK8KS4H7oooOLjtG
 9NWjLJAklKjI7rE+9KQ==
X-Proofpoint-GUID: Uz-HqG5bVz32o2h5_BDpEkbdOxSoH0Ro
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX96NyAArL6R1t
 ZNWKg7iBzW8To20w7ESFpKwdp9MgJr5gMuPawB+f4QqLyC6a2csVCqN3T4E3H9QTq3Ztn7dW2W7
 oewSzaWVL5YxxLZlxC1FTxag9Y3ASrc=
X-Proofpoint-ORIG-GUID: Uz-HqG5bVz32o2h5_BDpEkbdOxSoH0Ro
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

Factor the buffer address latching open-coded at the three call sites
into vfe_buf_addr_latch(), which calls the generation's addr_update()
when it provides one and falls back to reg_update() otherwise. The
write master configuration programmed by vfe_wm_start() still needs
committing, so vfe_enable_output_v2() now issues a single register
update after buffers latching.

Tested-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com> # SM8750
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 33 ++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..f39e1f303c9bb64a41c59d0d413608b5cb54a8ed 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -443,6 +443,25 @@ u32 vfe_hw_version(struct vfe_device *vfe)
 	return hw_version;
 }
 
+/*
+ * vfe_buf_addr_latch - Latch a newly programmed buffer address
+ * @vfe: VFE Device
+ * @line: VFE line
+ *
+ * Make the address just written by vfe_wm_update() visible to the hardware,
+ * through a dedicated address update when the generation provides one, or
+ * through a register update otherwise.
+ */
+static void vfe_buf_addr_latch(struct vfe_device *vfe, struct vfe_line *line)
+{
+	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
+
+	if (ops->addr_update)
+		ops->addr_update(vfe, line->id);
+	else
+		ops->reg_update(vfe, line->id);
+}
+
 /*
  * vfe_buf_done - Process write master done interrupt
  * @vfe: VFE Device
@@ -491,9 +510,7 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		output->gen2.active_num--;
 	}
@@ -564,10 +581,12 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		if (!ops->addr_update)
-			ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	}
 
+	/* Commit the write master configuration programmed above */
+	ops->reg_update(vfe, line->id);
+
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
 
 	return 0;
@@ -601,9 +620,7 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
-		if (ops->addr_update)
-			ops->addr_update(vfe, line->id);
-		ops->reg_update(vfe, line->id);
+		vfe_buf_addr_latch(vfe, line);
 	} else {
 		vfe_buf_add_pending(output, buf);
 	}

-- 
2.34.1

