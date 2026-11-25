Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601981;
	b=Hwf85kWEmF5OZKCw8fjY7ZquHfQAVckMiUtyEQOvAj5jmWRw7EsFFHUIj5wq08XJ4rKE
	 gHW7tuNzJhSXSe53oaGkrQb489D9ccJCemgLeFXcyRttV2+U1zcjNDAUBuhS91+IYMYhX
	 kOngJBdlD964pWijgUNuKhXx9K+qYUrNWKLQ24JQxi5UfL2PhUJERsoQxAGtNDT5QSJtK
	 DL0NiN6r9acA7K3MKFggltnpbfXephzKj9yluWkdFxmE1c6s4wRxXYRWeURvtiAw7j7eE
	 1e2GSbFBSqbsAa+wYLLEtOuRNR4jw7XZ+P9aod4DgN9MTPPbE6Cc1smFxABn2KIveKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
	b=XC8UEKqelQBjMu31TCsUM8gMDpDPO94wSDJBOlMMfzoQvRMo63NyakTmBGvPUJmMO5RL
	 T01sRAA49Jw94NiMlCJSZZXvU43+qEFFRrS+KPwtslY/3v0G58VG8leKJqDIAbn12GzCc
	 TcvwexRySF5goqP2yd6d79Cr2EFEZwrIzkBkAJIoYt192aCd/lRU1Ou51CVTW5RvzOqi5
	 ppMDeA/+1PJutZCS8JveA5ATYd1oFTmj20uo6zl2O/qvdtKnWIGoOfHvRBv6ZpoRHWZoT
	 6CgloSc3sKu3lb7JtTVS6RS9ki5w85opqm1t5NX33qK4AWsroPN565eH7mepKCjWaMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvZt5M7c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+AzXQRN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91D060A3809
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D91D060A3809
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HvZt5M7c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=S+AzXQRN
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mQv92356563
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=; b=HvZt5M7cvb95m36O
	5ovMIkHPraDyEaoFtG9TsyNAsjv09qTqXYY7qUGCPItKhVqn5/OChqTWibSmlQYH
	knc4NvwW28yDe4mMF/UknJrqIcchbk8cLe192pK96NZUmbcw4P6jmqDfQGHsr/16
	Nae7t4Im/4FZVqNqsR1At4u5sUbMhQhNohzdNOIswVlrw+hC7LWpEQNvSKsWEv+8
	ps7XeHpE6fsZMAb/K480b23Gylzt6CZaN3TzKwIRvkhNOOn/sdll8c4UA33PQkYo
	p5rjVTV7wYnBADrBkPtc4mymx1ewwLmdqUKL/TNv75GWGO2FFJpOOYu4R5teh490
	NxoNRg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6a10x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-92106c98714so113228386d6.3
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:19:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601978; x=1796206778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
        b=S+AzXQRN1BCwylBsAzwaNALXwFFD1MYalyg92TLVeVA4ZrGZiWJYvxXy/jL7uDZLaF
         dkt9gUTvZIpM3WTVPSygasOJbhKDwB6enRsrd7zFKH4jnePBSD8tIoM+pIWBWA5iPCcL
         iIWufWE9Uju8DZ2rAsj13kqsuwjdRgJ1TmXrwP7zH3ZEFWMW1e2mEpI7rK7jhDwhLsrI
         wvlij9RlpcN5OUthroo2dhbY9kBsK2AEQPnGJDqOAJfcFpBbIU/OtWt3pdZq0AwIStoD
         67IBkeedSyGxdfRn2SYWIMJYPXoUK1FGd++BbUkUBTA42pE6ukPObYDed5iq/VvhitLH
         HM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601978; x=1796206778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rvEacf5HA67X3IxGNMpjqT61srhuijH4DoiDDpdhvQg=;
        b=nMhsdnQGeY02kCyhmf+wWMyzEIhwUBJANzmUx4j9R3+Qdt1XtXnd37ur3BAlWRbzqq
         rhBNovyH2/xKVrpAfho+ehEBdZDYqDdENyF4QHKopvEHVRs7gO4BG+fnLxWr6Yg5q6tS
         9VDnZ4yp9ZeX8GzWoDyzCqeSBPhPA4jh45lODlaQ9aoFz2YCrBRGdHopWEDLvOb88WBx
         31G8gAv7DFrBqXK4spgDjT5TlvHmGesi5UzOhfqHd2q266+4bkBscQSr4sm2QritEFpZ
         FE7YGEDdFoPLwq3CCepXTAJmGveatdn1M1bU6SC14/RvcnsxBZ5XjepW1JLBAbybUOyZ
         Xkgw==
X-Gm-Message-State: APuU4Z+QVTMtGW49mDReJA8tqT9rdM/8eouDS5u0gPbJSCH2EeZYL6R4
	zvbnJthB5/3cCPihX4YLYNsPtnLAdeEIcYkpJPrhX6o9vmI7SS4gBDpPuSCIj/d4tu0sEq6W9ys
	+gJJxFa2+VenXqoaG1mOE4hIiosOyvVM6llL5rcfzyGWE7+6cDk3oixlg8BdpbRjpJA==
X-Gm-Gg: AZFdTZep2ajS6MUu+ffO0HtPYEFu7znc3zuy1RSgZf+XclMwyZlVJO61rqbVB5sXf38
	jACPyCcMIxIkv2Gh7egsG1S8/9jdp/+K4G84b0Fn2A2kz3DkL/LvXATxZftN2fcJUSdrDHgvJKK
	ssDdPlBBh9/ijw2/66cIawSaHO2n6bT8Fr4xE6UqRQABsp4AzPiQsECXVUrqVDg5gvNQX2GhPtm
	qK3MI6CYbvYsE7b45r32tS2r9livt+es+WD/BnIVwuda/sEG9XcveuqO0c7eyjMuFBENbE7zXxD
	QbkM2DUAB5WBKPA/MLB+SkpUYH3UbErWe93GFZM6rS8Qq51CWqfTJyspE3zAsBeP4XLSSBVHkNN
	c+8A4AWjIUdWZcCu+BtrrR8I+jFo1RJa7fAsBgcN4seT8KnBDekFW4O64rjplRIjgY5HEw/iE0g
	+gSumeAmwnxCy5dQ7gFDUkq6I17HVNS/9N+pZpK/yCVm3yI+JSUxbCxh2gcGld882sOzpkj32c2
	lES9sWPKKhMTUz5Cqxkkds7+xVa
X-Received: by 2002:a05:620a:6484:b0:939:fde0:a71b with SMTP id af79cd13be357-949ba6c4bf4mr2958871585a.0.1795601978003;
        Wed, 25 Nov 2026 02:19:38 -0800 (PST)
X-Received: by 2002:a05:620a:6484:b0:939:fde0:a71b with SMTP id af79cd13be357-949ba6c4bf4mr2958869585a.0.1795601977545;
        Wed, 25 Nov 2026 02:19:37 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:36 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:31 +0100
Subject: [PATCH v2 7/7] media: qcom: camss: Tell userspace we're using
 start-of-frame timestamps
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
Message-Id: <20261125-camss-hw-ts-v2-7-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: ySCOFuzu6zRCw4JmOFm2pLp9c1R5iRVZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfXx99F/Vf/ZNcT
 pxys/IRjtYJ7y8/Hba2mcbVPyeaWTx2Iz8FlUYSkLrCvecDBN01dcBohik54jkyO+r/DqyqKHMP
 HZJMncabppVybHwE2vfyf6cp8Cn/Ecw=
X-Proofpoint-GUID: ySCOFuzu6zRCw4JmOFm2pLp9c1R5iRVZ
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b06b63b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=DYN1bkTOkzx32VtlnxQA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX1iIkUoY1uL9+
 VDIymY7SeezfMgr8nyB/xwK9luJBET8d/MUv4YDbccYSDtuPCIP9jlMjJabjleMT4vAkoILqcFs
 pgupCswprnrgNteyXavJ1VK+hxLvAh6THNiCsrxKh1fSmcvSnhv/QdvyMd/av4dOzvNZj8nURbk
 dTHAMiR/CEjilPN54035edlKRIvATnRSa/RtH9RtIdQz36g0M01zGmR2iy7UGTf8kDnOF9eVndN
 HH9LkkvB4GpKTkNIjjjNoF1ncm0lBwM9E3VxYy+EmNk599+S0aXGn50v3fws3Pn0gZYqQZS2i/i
 Ih7EavMY8jvSZW8oaNzONN2AYUHExGJZsyGw0kGMJAC+Kg4R3ZteOaweNa0CbN4ZKwvSBHpWA9r
 mAP+uL7ERdYGq/CqTAKwItZBZK9WGdPJOqyiC8hNU3kACVtZTOhn/79ID0Pa9DzktSnZv0hLR5G
 nrdyFHQDOY6E4kcyZuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

On the SoCs whose CSID can track the start of frame, the buffer
timestamp is taken when the reception of the frame begins, not once it
has been written out to memory. Show this to userspace with the
V4L2_BUF_FLAG_TSTAMP_SRC_SOE buffer flag, the closest the API has to
offer, it is defined as the start of the exposure, which on a rolling
shutter sensor precedes the start of the readout by the exposure time
of the first row.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c |  2 ++
 drivers/media/platform/qcom/camss/camss.c       | 12 ++++++++++++
 drivers/media/platform/qcom/camss/camss.h       |  1 +
 3 files changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
index 5de6ff5ecc76a2863e536fca1c40ae6b2de6dc0c..4ce87527b9b984068f5c9a9cc3bbdca645cff1d3 100644
--- a/drivers/media/platform/qcom/camss/camss-video.c
+++ b/drivers/media/platform/qcom/camss/camss-video.c
@@ -698,6 +698,8 @@ int msm_video_register(struct camss_video *video, struct v4l2_device *v4l2_dev,
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	q->io_modes = VB2_DMABUF | VB2_MMAP | VB2_READ;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
+	if (camss_has_frame_sync(video->camss))
+		q->timestamp_flags |= V4L2_BUF_FLAG_TSTAMP_SRC_SOE;
 	q->buf_struct_size = sizeof(struct camss_buffer);
 	q->dev = video->camss->dev;
 	q->lock = &video->q_lock;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 26e3f2aa3ef2485e0486eaa89f93b804926b6e32..ac99e84b94e73152b82050e6c6727dec238e188b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4839,6 +4839,18 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 	return 0;
 }
 
+/*
+ * camss_has_frame_sync - Check if the CSIDs can report the start of frame
+ * @camss: CAMSS device
+ *
+ * Return whether SOF tracking is available
+ */
+bool camss_has_frame_sync(struct camss *camss)
+{
+	/* All the CSIDs of a given SoC have the same capability */
+	return camss->res->csid_res[0].csid.frame_sync_en;
+}
+
 int camss_pm_domain_on(struct camss *camss, int id)
 {
 	int ret = 0;
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 8154fab54f99b12456cb377dc4ddfcadfcf8278e..da1095c436323639bc0fda5ebac8026a09565108 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -177,6 +177,7 @@ struct media_pad *camss_find_sensor_pad(struct media_entity *entity);
 s64 camss_get_link_freq(struct media_entity *entity, unsigned int bpp,
 			unsigned int lanes);
 int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock);
+bool camss_has_frame_sync(struct camss *camss);
 int camss_pm_domain_on(struct camss *camss, int id);
 void camss_pm_domain_off(struct camss *camss, int id);
 int camss_vfe_get(struct camss *camss, int id);

-- 
2.34.1

