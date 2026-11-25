Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631041;
	b=NiiS2MrhJs/OFx00g3iQbtTT81h6ScTo21Rbhs8AJYeel1rJgTx69bxW+a4JQs3OeIc2
	 Ke864SdB/LTrpPGT+y0Xq8pQ10CYEPtEoCsLGweU5vTgTP635fQXbB6/vwVt90bYrtJBA
	 ePQ7lxADxS049zU9aJFpKXmw0kb04l1Ax2M1BxbsiqDhJ5soXZ5a5gmgMOBYEQopf722E
	 SpyaTA11TD0sdxWSz6v/9RswtSpMIj4icvFEAm9nMQ8p7eP0AQc9thTbyTzwyN49g3GpG
	 lw7ob2t0FEAmn/sZn4ZmVKjEQdXbj2YVLGXy85Zsc1Q2qQqfOW7HhR/PuFXtkX1d2Wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
	b=X26h/tqu8jm9lxCQf3iqUhILmcV9gMIDNorDCC+eoYB+8l4BZk0IrUq79wqg98+sq/+i
	 qKmjLQVwbbA7QQkL++w6+xQShcbasDw+FMQLJHUd9G1Ib8EpEkDY3y+PrboYDVDpdyQ7B
	 +ZeNvgKbwOyOWht2cfukub0EWiQc3vgf5EmxOg+rudk4dQd+wWKpUVuUr1FZWZy312rHy
	 6xY5cpRHOjkLLoPIlfIZmbiWg+JbMMO2zP20EmAGS54RXDFOgYEb18WSya1NL6uRxIUWR
	 VCJSqS9UiuGIhvYkGK1Mg2mSOW81zI9OrVAb7yUM6T5HNMBXg7S3vN1wtQbXWoKHdcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SqGYS5HT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUDTglo+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B05606A6A1
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6B05606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SqGYS5HT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUDTglo+
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQRZA3008338
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9E9zgJnH76U
	W6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=; b=SqGYS5HTm1csOaxXxCMfFuXhn9Z
	0cc2pROyHUvKtsedRPvVu2TJ4VQ+zO09gZm/lMX5FF+r+XVvNKj1ZZuVUltdlN+3
	7+DtYym3TcOz6ParrlWos6hdJJimjQrHYcwR7ECOFF9SngKEoBQ9UGrK9qw5fDP/
	843eEGNB71/OMDjMJECiZ/5DVRNtr4wDbhQ3XySS7NALWFRb5I3ZfCP3j8KzQx8J
	IHNHc0wfE9NEa4POobVGTFJXr3JBhuogIk+Kowj6+PmUCw4oCfMdLxECtH1RPxCk
	dQ5D6dU+JUCBBYR/Ywier+3jD5/Qo+CQZ3lZunpr8tZr8Eh8ZOgn4WB4oEA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukt8rr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:59 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0e4c2f052so18468527b3.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631039; x=1796235839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
        b=BUDTglo+2c5M9xNp3bSXFyoKp4mep1ERhhvVCkAMxz0gp6HgL0myBR/HjhPB1ZJKgr
         oHrqxCJm+QoIFsAriioHtB6hJDjevBKNhl7o4neNU4Uojzkag4DGMI97swRJCH/uHCa7
         g8TfQPH3dQgekN9aW2ZJspjtI8DP7IZxXP5CNUNCJ30rKoheKTaQZY7LX1TfhJw2XqQr
         QdqOBt9lSRbS//0OwiqDm7Ebq0m26VJtzoam3854RlLGFI/DsdUMJDJ7pYEkRrP1lVPo
         SWWnge15bddqbXeD6/4cVglprVBzTmXWtAuEbl2nI7qZ9Z1vM/AVkTnchbCoRHvHsjgU
         xtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631039; x=1796235839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
        b=STgXEMq9a+eA0plp+ve3kSGnJ3PZAXj7Uy4ZbvR9MTtPHJmZFwg18NlxfTo9DK3tIu
         fDP8ulBtUicsU6+mWG1+d9sJJzbDmNlvErZQv66EkaPi66MvmsJ0MvTMEq/ma5qbvLm0
         1EEgY0ROz3GkQUodcnTfBhGS+6xrXLMQ5+k0a0dMs5V/5Q8PvVHtScxnVsbh7PMi6FCQ
         ItyEEUE1syejmWSFMGIxhBIYWSShGth+v+cBBM0fozxBBKZLbY+tqEvp3t2kGor94zDo
         EFaHoAVRZDBSgDxZGNllTuZ9tJmv0amXNpWXhEt21HVcGhTJyLZJxPqvlalaxtk5XIhK
         Sw2A==
X-Forwarded-Encrypted: i=1; AL+hErGj/c9/d+/jZrPvAljb1sHVOsb6VIYKzAViZKg2zSN3MqHpVtbKV72PZzwI+44BSsVfS7u8aWIUMlThnw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CSxvYc+Y9SfgXVFcDso1WVY9U3wR4Tgsydo6DDa/k++KTZLfH
	nDA5N2QXMSTHSy+ygAVv1+N7WOJhPviS6Ize6WVH6IFO96GZyb3foZfgLBsTmqKC4ybS204p0BG
	WsjNXAAdouEwsJYkeYVd6oyO+8NDyNmhnjq1gvfx8ett/6wLdzda/jec3MIP8Zv1sDw==
X-Gm-Gg: AZFdTZcAlV0n/iKmhYesvnITBrOz7tJRqAzQJKAZBR71seZSEMCEHHYO09rmk5dvF6U
	unaTq8F+/A8uh1lm4X9NKaXKsjfitJc4JLgrQN19gj2WarXGJYe45zEp8HzqS4QRScPgmcsAMm9
	Hd8/gk8IhGLxLpaWtQnGcqCJ3yUsfXAeIcw7b/Qv1ANrvwxvbNVFoKKRAloAXrEN9DxG39YVc23
	DtQXO//mMmJfRz9HUdRiAg2GuRUDstfQfRuwa0yhTChaFgak5YoZybyuIksNHd4k09UOo6YX852
	q4iTXrPgeOGeonwmSWx7Pbqaq3/evk0AKfNWgajD3oQ0XYjpolpsQA5L1g7Dvdo8LNuXHZg3Y3I
	Bn1cw/ArmfSNlodQ8YdI7lXnhAh1RGjvla8D69N+ENnVCftAmbMQhOHIZgH4qj1SskG/y6h57zD
	4Vzc9j
X-Received: by 2002:a05:690c:888:b0:8b4:dca4:56e7 with SMTP id 00721157ae682-8b5204d6981mr75798007b3.45.1795631039261;
        Wed, 25 Nov 2026 10:23:59 -0800 (PST)
X-Received: by 2002:a05:690c:888:b0:8b4:dca4:56e7 with SMTP id 00721157ae682-8b5204d6981mr75797867b3.45.1795631038670;
        Wed, 25 Nov 2026 10:23:58 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
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
Subject: [PATCH RESEND v2 10/12] media: qcom: camss: Enable streams API on SM8250
Date: Wed, 25 Nov 2026 20:23:24 +0200
Message-Id: <20261125182326.2767771-11-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b0727bf cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=onitAmIIXR4QNx4LYmwA:9 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: gOLNdcC9u36rnmqTU9q9ufL0Ld_RwiQa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXxAnfuMWYXjgo
 rXLhpAWj8Jx+aFzqs0Q3ZiLgIVWHDp+X7mELeM+dPrNO9uwV9mHfF+b713K3c4L1U3gSwL5qdTR
 Mwp1kvMrM6nrGEMON8dwKd1F7WW3EWk=
X-Proofpoint-GUID: gOLNdcC9u36rnmqTU9q9ufL0Ld_RwiQa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX1oh5nLqVjRat
 R3wKRrx9F27bg5nX88rTO9yFjlUWqtJ2FaiiTt86N+1qsjyNJBsnmxiA2Gt40eNKZky6DSaEec3
 MkNjo3YIPfd6uxGc6HGDmXsWhmZOSc3OUNlddtR22JQK8z6f6mXVIrdZ7iGJKREj6HOH4SnsucI
 fmkhtJkD65V7x4X/LqaXIiBAQiBqaVB3ZApt/BdaK4T8zcnABz9CHF9qFxfKiJfg2IB1dXqhRkf
 ShiMtIeTv2MjF0qR0MAOYuiQZ313THZmYAWsycoJn/bwvUJsM7Xmb9IDGkwgG/Ctf1RHvDMZImO
 ACm8u8N2tI4PxxE3Ku4SXOf16F/Lgm5dSkULO3O0CqAhZ3jF1BPOWvZgT2UXzBFtE8FGF49FGUE
 zBUUh+u1sYB9MoXtq830/rqBwJ/SapOxzU3kRPS/NWTljJidOSIi9hVcFBGt+HCyq8DQsLU5NNF
 iE6W1FnCoboZtWxK2bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Set streams_enable on sm8250_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ac12960264ad..77fa80dd79c4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5790,6 +5790,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
-- 
2.34.1

