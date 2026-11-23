Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454220;
	b=TTOB4OifmGRkEDPoj8jQ/kuLEZ54fKNLKXc+6mE/1BoY8tNhwHooKDGzLWeAvLMHBVAT
	 EI8DhB3+C/ZpbgF8wio67hBY7/h0lw3an5Quz8Ln4MwmYBiWdHQuqsknqaHqGRJNGUVDc
	 OcOXlfTnyX+u7Abw+YAlfmXiwMpZWP5Z/ZzeQeCn/WA6AaKy6IwW8kejs+3tsxCHYqikS
	 SuUtjY60d4pvqOD4StBngOsrGntcg14+9SauS8xGPYgeeN37Gl28HGP4+0Qu+zv65vYJd
	 XG1mUez/z7Bz1yfFeoEg7IZgINP+taWM803x7PjdmwkAZVw8TTGP47r5XY7W0Vnx5Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454220;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=;
	b=YK8LRcKrX78WvrkWCrglmi+eTePpkhBK6TRj1gImC1TRjZ6hK7nnUPn4ghPlPa6s1rcV
	 OtHZCOo9ZMPC+oFocilUAjYZh732iJC7bl5BtaWzFAJzIXdjTDucXd6ACC78RkTet6tbK
	 VVl5hW1kkcdNpHEJw6a5GFDdbuXBspWvJsz6XmXXAjnlGYbkzcffWRcWDAibwWKy2G/SM
	 WDVf/0OjGdGnvh2f5iiL25y8gxt4aESTQHgreWleX7un/+ZcC74v7YtdetIpeAnGFBeEn
	 2u/rEpPrUxwEEdXWtdKvg9HY5MJqRTnA6B1u/gKC9+/OV44enpxhecfqXpufxwiBn9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJfHQwXm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P6yoJDXL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0197E60A261F
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0197E60A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XJfHQwXm;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P6yoJDXL
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH18r2769438
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=; b=XJfHQwXmD0kmVePw
	aeayLVr+799PPXnhzzmsUKp6E02QG3y9Vlct4jDVDZ1TJPSnowNafCdqkoL2IcRL
	fsOTpcvFgbImWuZMEGUK2arMxJtqhps695p5Lr6KMDxmoc7UpygvZ0HKQstnnMh5
	LSm4ZWKrDPlRoapOhrIiVnxa9SVM6+jJxZZ/IinAf0BiWrMWe8GVX+NbrZqcanQb
	F3AAqJmkMBBTuW8szeDeJZ6DvnV0bmcMXPGueE7/SRiz3KLRqK+iBOLHHyWC2ojI
	3BahTcFIpJqCZ5QCFbUtkMz+U77yz1a4Wmd1dnyyrVy0dRHFzkCotnssLqyqMf/6
	YNHgLA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagxx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 17:16:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5ecdfb84b68so2480344e0c.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:16:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454218; x=1796059018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=;
        b=P6yoJDXLNJfinewQysOCv4obHs9+4zUio6Xo30NhfbFk5A097knUdYFAajkUUS9rkN
         ckC6FNbHaT8QP2oBNBEFzDeOfC5VxXBdgUw+XZMZ+gwfvs35REebXuvIOrUvtAGPSYeG
         l7RK8XwIjbZNlq7To7khETRh5FqaoUrbKRpIQE/62FcNW66pqWrosKd5H/2VyLXV3nOZ
         q9RkjwzZZuC157IgYLDH0zO7PxQeux40gGFKYB/fcNtj0AUjTLnkDD2N5oYgFjvdb73y
         3E+f1YOYeR5TW7kNDuGlhwUpw90JvtbQc+R8cVuNVWG3K3Z1bQkjj2ZnlAjlWgq2mPVX
         NPOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454218; x=1796059018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=33+VNCLHj+gI/kqezroQpXvnYa3WMeXV+W/MqB9QA3Q=;
        b=ChiLvoq9h7EfDf1xuWLYjnL5keAWcDCoVmns/hckvSevE6PCU/mYjV1JdbFTvWrX2B
         AbjgMwrTYvrokNCgKCUgkaXJgXnYpvjZZeZgOU42imID+zGbZrZnJ8bUlkfgpE7Y4X4b
         UAWje7Y0nRridtLGaYimHYa6JpzVuMLPINAoLC/TySysg+uWwxJIa669JdnaCuBlyw54
         o/0q8CTp33YOCz6toAfSFhfJzyS14xElvBXrOyJWkVdLYdo3pdMQjZHImbWBwOYYXbDO
         uI5IRFqBVKN1POyCErW2uU0D3dWgkv01rfvMH1S+WBGKfNkBxXg/Z7oE7ym8SdHsTvtK
         7zRw==
X-Gm-Message-State: APuU4Z/V06eTaHCYSr+7CkSETPlcwHNRgX1zrrynrBioWZ8D4oqJyPgl
	cJqpoUmEsTSepi5pCGeuSSCpIBwjc/XcuH58+UYT1xS/03fFXn+qK9XKs54bAIq/L2yrF7MugxW
	chRdVJzVy3nyAnvPvjbOHUc8lwHZqjSMqushkvzWXYHDgr0b03dPkj5kn4TUEdWY23A==
X-Gm-Gg: AZFdTZd4Rk2cjE8EkUiYyCGZAEMzYgrEPxaNgBesuH9tMcA2cS5ewBLmCN/R9HOAsKJ
	rD+0IPo08WIiVEABBqJrwQorn6C+y7vtDHkEpFenhbaAEfoXKEqvyRP9xpMKF8oAEu9Ir46MBmj
	WFb9IwWIbQ02ikVwqksSsmqG/RW+zvj6bshlMp+k+pa12T0Re2geN1qK7Y4FBEJ+cXbTYSJZL8r
	8mxF2tNceWMmbt5RKK06OiqAvPtl69e1v1MDx1+onKh86u2WOhBMPKtdimKumnyhttU/pFtObUz
	kSxu15+EIqlx4tJwpBErBV2lghii4lozGAe6VjKDA1wtBPSxd8Nr0t0Ne+PcQXJO25pzIjuEhfz
	6QjkQeOUmEUYEQf7Tdu0vPhdRbRFuHZ0QG2NeCBWUxrYM5UZoh58v6OC+SF2LIS2yDJFI7L0ZmQ
	ilrW7Cw0yv+rdsKk6xgHhB9rso3I+mVMz8iWEptV4sUImDuwIHx5lBRQJpPmXKtP+1qvUNeqn3l
	KXZ5Qs5D5sPUQcU6jDJbe+rfbvo
X-Received: by 2002:ac5:cdb7:0:b0:5ed:fbbd:7ee3 with SMTP id 71dfb90a1353d-5ee823990fbmr3420154e0c.2.1795454218274;
        Mon, 23 Nov 2026 09:16:58 -0800 (PST)
X-Received: by 2002:ac5:cdb7:0:b0:5ed:fbbd:7ee3 with SMTP id 71dfb90a1353d-5ee823990fbmr3420120e0c.2.1795454217707;
        Mon, 23 Nov 2026 09:16:57 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:56 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:52 +0100
Subject: [PATCH 6/6] media: qcom: camss: Timestamp buffers at start of
 frame
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
Message-Id: <20261123-camss-hw-ts-v1-6-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX/alpwTZ3/6EG
 cUFWKCcxvILyVD/4t5rlt4VIk8wzZg3e8dxikFP3CyVNYf4M5NASRpnC+qYgRRlYMWK8Kmg/t4S
 iLOJQV0VMFp5KKFRiJ5S/R+frwBb7BgkAdlsE+VVbUd4ha0W2GuOTWaAjc4JKjt0zqrUv9GeT8R
 k3TAj6w7C6Hlzzl0Ft6C0ZZotu0RDVMXHcoG3R+1Bu+pFMta+Zj3kbtHorsMZJ3+Mh3IUFTRwnD
 7JTk5zEjjSo7ImiWAhUgLS+dnV9GrWmx0cIfitrOb7gMh7NSUFrK3iBwjg+3oRQQ8Flz0r7jmF2
 w8M7+zL/yh11HEaj5qIzYneKZO0YfO+YCZFOjZ6sIk6W4u8kJiTySFYWtNGJPAgZbJbMBqhlINW
 C88H+CpTiF/kvxk199Iy6xAbjwkkQiONcT5cEAoPcUhv2j4ol1BkrvIZEJX8NNJY5boymo1Lc7l
 MCPz3KU7d0Vx455ja0Q==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b04750b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=cvNeV7CIaun-QT9ljzQA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: 5PNeo4eYzzDcfDaFt6ltqWJImNRdOENd
X-Proofpoint-ORIG-GUID: 5PNeo4eYzzDcfDaFt6ltqWJImNRdOENd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX1vKn2DGsf/o6
 2owiv2xFCc59H4RJ4/7ucgXQTQPQiqwlMH2bQYO6gyjc83HmBeJUn8LfHjlFR4Lk2m3tbss0KrT
 fZsZ9Yzn5b1BNafVg0hy+cBjdiq2UvI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

Buffers are currently stamped with ktime_get_ns() from the write master
done interrupt, i.e. once the frame has been written out to memory. V4L2
defines vb2_buf.timestamp as the time the first data byte was captured,
so the reported time is late by about a frame period, plus whatever
interrupt latency the system adds.

The CSID already computes the SOF time, from hardware where that is
available, so hand it to the VFE the same way the SOF sequence number is
handed over: the CSID stores it in a per-src-stream atomic64_t, the VFE
picks up a pointer to it when it enables the output and reads it when a
buffer completes. Hardware without SOF tracking keeps using the buf done
time.

The frame to SOF association is best effort, as it is for the sequence
number: buf done reads the most recent SOF, so if write-out of frame N
completes after SOF N+1 has been signalled, the timestamp belongs to
N+1. That is still closer to the capture time than the buf done time is.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c    | 22 ++++++++++++++++++++--
 drivers/media/platform/qcom/camss/camss-csid.h    | 10 ++++++++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c |  7 +++++--
 drivers/media/platform/qcom/camss/camss-vfe.c     |  8 ++++++--
 drivers/media/platform/qcom/camss/camss-vfe.h     |  1 +
 5 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index c77fafdb9fe450aa3bd245144de353cd0edb44c6..fceb5055bc021bc8ac2ec8de28e1d26f7a337c5d 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -792,9 +792,11 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 	}
 
 	if (csid->phy.need_vc_update) {
-		/* Set to -1 as we want to do atomic_inc_return to read */
-		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+			/* Set to -1 as we want to do atomic_inc_return to read */
 			atomic_set(&csid->sof_seq[i], -1);
+			atomic64_set(&csid->sof_ts[i], 0);
+		}
 
 		csid->res->hw_ops->configure_stream(csid, enable);
 		csid->phy.need_vc_update = false;
@@ -1383,6 +1385,20 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
+atomic64_t *csid_get_sof_ts(struct media_pad *pad)
+{
+	struct csid_device *csid;
+
+	if (!pad || pad->index < MSM_CSID_PAD_FIRST_SRC)
+		return NULL;
+
+	csid = v4l2_get_subdevdata(media_entity_to_v4l2_subdev(pad->entity));
+	if (!csid->res->frame_sync_en)
+		return NULL;
+
+	return &csid->sof_ts[pad->index - MSM_CSID_PAD_FIRST_SRC];
+}
+
 static u64 csid_timestamp_to_ns(u64 ticks)
 {
 	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
@@ -1435,6 +1451,8 @@ void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts)
 		.timestamp.tv_nsec = sof.tv_nsec,
 	};
 
+	atomic64_set(&csid->sof_ts[id], ts ? ts : ktime_get_ns());
+
 	if (atomic_read(&csid->frame_sync_users))
 		v4l2_event_queue(csid->subdev.devnode, &event);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 4f55c72a44ca3a6cbd29861aa5c90cbab9ed5932..50c4f96a691f2e1b7196427566b1c0cfc87da1ab 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -179,6 +179,7 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	atomic64_t sof_ts[MSM_CSID_MAX_SRC_STREAMS];
 };
 
 struct camss_subdev_resources;
@@ -292,4 +293,13 @@ void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts);
  */
 atomic_t *csid_get_sof_seq(struct media_pad *pad);
 
+/*
+ * csid_get_sof_ts - Get a pointer to the SOF timestamp variable.
+ * @pad: Remote pad of a consumer's sink pad
+ *
+ * Return the timestamp or NULL if @pad isn't a CSID or the CSID doesn't support
+ * SOF tracking. It reads as 0 until the first SOF of the stream.
+ */
+atomic64_t *csid_get_sof_ts(struct media_pad *pad);
+
 #endif /* QC_MSM_CAMSS_CSID_H */
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
index 4972d3ab65078387735ef2e853bf1c9c3d82baee..6b8df1f6e2a731ccd0e739edaa82221c18203f74 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
@@ -472,7 +472,6 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 	struct vfe_output *output;
 	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -490,7 +489,11 @@ static void vfe_isr_wm_done(struct vfe_device *vfe, u8 wm)
 		goto out_unlock;
 	}
 
-	ready_buf->vb.vb2_buf.timestamp = ts;
+	if (line->sof_ts)
+		ready_buf->vb.vb2_buf.timestamp = atomic64_read(line->sof_ts);
+	else
+		ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+
 	if (line->sof_seq)
 		ready_buf->vb.sequence = atomic_read(line->sof_seq);
 	else
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index f9bd2367671f6e50c6948a6405f78b8c2b03e5f7..ab4edb14ed7486724f12fbd024e0600d70f8355d 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -456,7 +456,6 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 	struct vfe_output *output;
 	unsigned long flags;
 	u32 index;
-	u64 ts = ktime_get_ns();
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
@@ -474,7 +473,11 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		goto out_unlock;
 	}
 
-	ready_buf->vb.vb2_buf.timestamp = ts;
+	if (line->sof_ts)
+		ready_buf->vb.vb2_buf.timestamp = atomic64_read(line->sof_ts);
+	else
+		ready_buf->vb.vb2_buf.timestamp = ktime_get_ns();
+
 	if (line->sof_seq)
 		ready_buf->vb.sequence = atomic_read(line->sof_seq);
 	else
@@ -532,6 +535,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	csid_pad = media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SINK]);
 	line->sof_seq = csid_get_sof_seq(csid_pad);
+	line->sof_ts = csid_get_sof_ts(csid_pad);
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index c37526caf9a6fc052c3f4ab4215e635167f6da95..8eda4592257169d04027a9a3c45233ac937eecae 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -95,6 +95,7 @@ struct vfe_line {
 	const struct camss_format_info *formats;
 	unsigned int nformats;
 	atomic_t *sof_seq;
+	atomic64_t *sof_ts;
 };
 
 struct vfe_device;

-- 
2.34.1

