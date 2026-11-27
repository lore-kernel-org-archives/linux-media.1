Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795930;
	b=JAURG5QBRdk9SKZjazQnerW0/13fVfseXUxP/mhDGnVw7y987R0zVPg1LPLVTG7P75xu
	 nRQlSpSWN+bWzAwB9DedaJpTOQ1ZfDhBgMPcS3rpdNL28BAH4VHM6NEevRzZoNMAFHigW
	 +2YeiYHHPOdyTKtQybFUJ1iQpfYW0eR5iHaK7H8Ebb/qzOj4C1nRDZ6EjMRQQ7yRx2e5Z
	 sLyuEINU869DOU/8hMmahTLTV9PDnqwuFufuLvQSk5vC/jv2omAFHeqvSJoQ+E74wMJve
	 oGdsHRvbcrlq2e+6aRdBRjREUQRvJqIB6+8YNEPlJlg4we+yLfZioYG8Tfg+VIH/1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795930;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=;
	b=5B0OpcYWDKbwHkJU6dTgNFApjliM1WtxjhhsfGKrG0bpCKrbek1z6x7ueM4wNMB1Dh6G
	 qI/Omqtwc8Ai6YY+furX3o3WWRivrB02mO57tSlAc8B8bSgrXoq5RqM7BOb6gcWUnUH8J
	 yVi9qSQ6Si+3E85X1+Itv7nUAp1SeN4IDPQt3ylJ7i565QdIBfM05HrwCTT5b6dxDsJo3
	 IWbX73qMe0F3RZ40zdxvvTMCPHJRgwyVCRXrBW39JFxuGMynd0IHPR9dda1UcgvePnqpD
	 DZmTGuG3geGZjg4AwpCxOT4QweTBedcm2A5XSkKCEua7WMho3oLeYFxWJQgBQz0QlNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLIWdi0G;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIxcFPHH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765A5606A686
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 765A5606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DLIWdi0G;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jIxcFPHH
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFp4aN2337905
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=; b=DLIWdi0GgA5rUN8h
	8/1hpQQpGSq+lwjf0YJLftwcSykkhGC5UReuQ8Vs9yeExP6lK4tnV88mjXlFGlF9
	kWankrG1C8iQtOhIAAMAbUikU4+Nz/MLUlkD7p5fbxHViGstifd1or2zuq8X/L9o
	IX8vMOIhax6hrelaRbIMGdyiHvB+NFxMzgS1eqq+oOMI+dEdaGA6MrZC1X0cUrSu
	F3yHufhFVMf/xfk6k6fIZDPAmoWPzkT+KfzCVCwDeC10yy8jCctNdxUWuSC2Xt6w
	QdiwIBbsQPGyqoPhvY7+KOakWx5xI/kWJL0tWtdHNluL1NrKsM8D7+nghF6zzxq9
	+shRNg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j756ka1jm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 16:12:09 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6799288480dso11697634d50.0
        for <linux-media@vger.kernel.org>; Fri, 27 Nov 2026 08:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795929; x=1796400729; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=;
        b=jIxcFPHHmGE0kej1GeVF7EGe44tb+xaPfi8U6b028aDwgoUJkfS2ChKT/xmipleLmV
         MBVGVyPNngrrtuh9bvl1jeZnTXTaxvet4F7m6sJb2xFdVl1w5iUX4KrSsvr15DjkozIi
         81VmG0ipzYLzj8r8yLc1sxsjfHGkDItQdS8MkfTU4MUMs4qMLWw7TN5TbLQ2d86mUSpW
         xTZ4Y6uQSUv1HojJb66NHN04oXhfKnqoFvWgPj91EeLEUWqvMHdNowqpsQyu7eefDdGq
         Vf5sAFzg/GFqULiv3WhZPKF6WsZ6om8NZLtmmkzy5HHyVQVnDbOOZUiufsVrIKyMFiCf
         L2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795929; x=1796400729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jRSMzTbrlhz8P387xOxNYbvNBDCXoMZtXwpUfZ168M=;
        b=En6Prs4l4k5YYGMaAwOyN1DK067yVflucuGojXtbhkLsEnJP2VrHpanHJnJill0oN+
         plC8hhlDNGYy3MfgydLSZfWWuOIx8eY94micshhoAFwzVmDHe8DqqTfDS9dYPPVsqk35
         f+Hgkjf+7WiXGggKlFBQCkmK0xCJNRE3c4wECKYqRQunRLC9+EXtjRlbegzZ7Si4/B0c
         /MBS+yw+u0IY2yenW2gZYiK1zSnq+xhjyBXJoeRZB0BtBJ0p+ESPTlrzZhNUEcVHXy55
         WVyj9AbBcpX9yPgIsYTd3/YCjsHnUqOpKgphXyIBm8pLNfYWHzrdU/zTnsoCMnKuYQJG
         GlZA==
X-Gm-Message-State: APuU4Z+kA6O8cf8KDgVm31iTtPDzsiFh7XmErd7U5ZZHkUVkz10q8ofc
	3n9QbE9kWaOaP0L80sSrqwmUDObKhhBc1qYLyuH7UQ/wrs7yD2Sc6SWbfmHAgt7MuLYWDiG5Kad
	+yaF8FKVaXtMFMQplzEqTrAoNTgCKqTy18zANBJR61vdfPZuraKZaXLrYHsJwprC2xQ==
X-Gm-Gg: AZFdTZd8AfbhS7CrGF7KQ0O56TTbnwDFg5RV1mueCRu5cNqhpZXECOByh6Jt+PBkOTt
	BPYZnC3r4ABKYIdVvkxxXsudN1w/5kOOIFBybv9KVRoPZMzj11sckfAi2LUtHLuBtCDMif3JGYZ
	ZsprGWJmQ27EjcRXE6kbt8wRymAgjynwM9HB0mpvFXK6LSJghwZIszabkNXr8MT3XXZrIJi8caL
	k1VdoFOj8pPI0HVTlqqMZe0yyn/FyOKNE9DGb8XtPXZt1UOwtaiKa1hhcmqzkJI3g7DQ1EYpi4L
	mLoPG9CHbiTDMYt2IRCFCo2Sj8n8Cp2cmlH0Edi6f1LUxI8YItuv7XhLaIgVKSsjl0D+jayFSVl
	+i2o0ReV8cts7gEyOBfnzbYE1ju8PMLZE0jGOn35xPwgdnrGACOdLRjWQ3Z50AW4ZMWflPqs8Ls
	tFTI0ZO+KxT394eijJlky9E6uxfrR71S1xI5SnKO35pYFi9plrLXqM+kqy38+GPLhKXCPrEnW36
	5CBpsS+6kvA6wSfg+1kFuxodYR9
X-Received: by 2002:a05:690e:4282:20b0:67d:b299:df55 with SMTP id 956f58d0204a3-67df44c44d1mr7379297d50.77.1795795928695;
        Fri, 27 Nov 2026 08:12:08 -0800 (PST)
X-Received: by 2002:a05:690e:4282:20b0:67d:b299:df55 with SMTP id 956f58d0204a3-67df44c44d1mr7379267d50.77.1795795928269;
        Fri, 27 Nov 2026 08:12:08 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:12:07 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:11:58 +0100
Subject: [PATCH v3 8/8] media: qcom: camss: Tell userspace we're using
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
Message-Id: <20261127-camss-hw-ts-v3-8-e4b6ad98ce9c@oss.qualcomm.com>
References: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
In-Reply-To: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX8XU90WxCWreH
 bXSNBsWIHPAGnLjftSsH8TBYwHxaKzr5aBFaVaolJ19MBFs7hQA+kMNLGFi7KEoGsSlyZrTBjs0
 PBzJycNXjnNlxtSJsX+HEEfscfnABWEb5YNdDV9rUIAkJ2CQPIEI5ReTD6TFQ7pq0pPIMl8W9Vy
 WTfiawXEiX8iPgYcWrVT9dxVu5g44BsvGq1KLyfWcOACOhB2mNX1mVzF0BwshryFblyuQAFCAwJ
 3EahloQRfZNyb8dbsHSR6iw59jiLg+Bb6URG1ubYytXmaZIZU8Yap9hGz0TQIwjDf60b0oQpmm3
 XpaXsjsscA9KjrDKCuUxCJKegZae3C3ios4rqjUZDvbq7m4XU9X6Rrn60hwJXPylCSlnmbLq6HT
 P2SzL1FQrxhf42Euwa3z5VCcftjtAdoysv+KbbyIDFYCl+9gEaW90PxKkVFC2gCpyxz7Dlo/K7Q
 O55Xo3ok36vJuABegyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX+C++zGTJyc+r
 oPFTwPEF0Z1dvdk0+MQ+RXpbuwFGjrGJHhMQ/syjq/ggEzN8QrplixBRyCUrUutxffi0PTN0zXt
 LL/87jblBySDx4+c+ckvv933g5lEAC4=
X-Authority-Analysis: v=2.4 cv=ebWo7LEH c=1 sm=1 tr=0 ts=6b09abd9 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=uxdOUlAlRnt6KrNjghUA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: sMlM0AuUkZuydyIMOQh2D5pcFVmvkK24
X-Proofpoint-ORIG-GUID: sMlM0AuUkZuydyIMOQh2D5pcFVmvkK24
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

On the SoCs whose CSID can track the start of frame, the buffer
timestamp is taken when the reception of the frame begins, not once it
has been written out to memory. Show this to userspace with the
V4L2_BUF_FLAG_TSTAMP_SRC_SOE buffer flag, the closest the API has to
offer, it is defined as the start of the exposure, which on a rolling
shutter sensor precedes the start of the readout by the exposure time
of the first row.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-video.c | 2 ++
 drivers/media/platform/qcom/camss/camss.c       | 6 ++++++
 drivers/media/platform/qcom/camss/camss.h       | 1 +
 3 files changed, 9 insertions(+)

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
index 26e3f2aa3ef2485e0486eaa89f93b804926b6e32..e60aa29051e71cd70bd3564a01655251ba2f37e6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4839,6 +4839,12 @@ int camss_get_pixel_clock(struct media_entity *entity, u64 *pixel_clock)
 	return 0;
 }
 
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

