Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601972;
	b=J2uPh/uMrNb67X/RFjEhvwykhca/NsO43eHtNe3ZDBMo0mbR7wltKqYmPOZUpLq5ncGA
	 2+1bPdWF77I37TGhoZqhjthuIN62fpCXhXb87qjWjlOvb0nf0s+4X123l0cBT/2Rb7OB4
	 85DEvMZOiTlLbhqflhRaOda9mUhC/NxLLZVL7caMgZsSCqxMNCwHjS1H6sU/V/q5/I81E
	 ypIBVyPqXgkBFzK+hHacvMBcbGE5tS7nm1ybLIIRw7W54/3rkfHu6M6R4Y9GpggPNqioY
	 t8qxkZc5nU2gkhw6XHIRWx0ZVw7D0d6U/3yrceq71ztKFHp6y/yUnQxWJZNf5NmOwRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
	b=eOJooCStR7eYJWHk+RwIrAC4Oj0ooZORrXheduyz2tUNzbKFmifmts/XuFzJQcSmAcq8
	 MFLZrYOS4aVh6b469v+Vnisr0AD2Naw4xZlyJDTqakyoaAYA5peJdq7oQrzQoQT6Y1sVj
	 pAUYPKgH1TR2QPm8hP/mH3sC273ywd+duPkELB4VXrTteKFtyWrSN3j+H/ce9eGRFklrd
	 Hfqop87G5D60CYJcRMizWfa83inKfNO1h7pndP7nfCUzfyxMagJ/TIfxMtimikdheqhlj
	 mthGzRoY32UqexGiQ05fmbKIViNt1nzqJ0xrd9OMaBeo354+E2YKXq6M9GdKeOOvx7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVYimvvu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzFQLovX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B57606A680
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9B57606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVYimvvu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzFQLovX
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mrGY3644047
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=; b=CVYimvvuTSHfnyAZ
	nvVbPbnczCElDYKdVxwRbOTxFj2aX5zAKDFaukBKugvRkK8/ToQTWeH3h2+aPIDV
	UXxbTe1FtDSdSkUbV0PFwfct8N0dDc0wH/rbSMcyfTydFnfqc+xdf0Cgu5k5CvTG
	X4bOwcivG5M564LuAt87esNVsO0bpLKzDdMghfCRwKOwMKLE6rtUNv65aEeDaRfn
	GO4f899kGDn6vC4GrpMCgVrxyW3II/krI3DXX6Rnnzcqxm/KW2Lf701VioRIsoRF
	TQbwfiqslk7hMQhvq9CCm0drY2cOHmb9C6A2adxld5LccW8OR0ZnKo1rlfvGRUTD
	J6mYog==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2ab1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so625971785a.1
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601970; x=1796206770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
        b=ZzFQLovX7vXSW90L7aLBUu9Pqkpid6r45/ailgTH+cegxxeMlFhrXPj5R3pgNFrLXC
         tx+cr3AkvcIQH7IFIuzI7jS5pMA/0IL2FQNqFtyVIDc9vtwmmN8qCI6dCJ6k+Q8JOcay
         gI9dkqwTmmOf6DLWqeve5Chs4tuTc+Kex0kyDrtv+Kbt7Higa+5mmJDEozcliM4vbKg6
         zoNM//yk9fWDkMFSLkkBG/Pye24nyJ5Tuw18jEHAZLmmtQ56CtXWADZTi/ITiAHjkpvR
         oFh2jhodxBZ+GRvljdUfqZb+qDr8Pw6qbx/Tb6xmw0rkKq85vyOzDJMD/ALQ9kRgcC1G
         5TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601970; x=1796206770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
        b=xiwFap0DtHlygz//tQ68sK8krnZDFlIRoFBetnXwK1JaDbhvL4qprvdkfgtGfbtTdu
         vwx8SOus/ZJcqdfwSevX0Fv9MZxOXIEDALNzYY90NE9bnrvs9TxpgQIknWjUaD+KZbHi
         XwWsAh3C/CcuVuCqXMQRuEGzWtEK4Ew+t7RiePgUEz2wCKN2Zoq+e6bxSVpJTgCrebHP
         qt+sNTutDnHf2u3mJEPY/wy54B5xXKdQ67KTKgJl/RnF+Iu5UCkJfG6V5qMJl6cEkL8i
         5BujavdVo48ETSq1XTBESVDX2lLlsort9jpbohbjrvVKJSkxBtg9za0vdnMGRBk4aGO3
         z+pQ==
X-Gm-Message-State: APuU4Z9XnAdPKeuxggIeMhc5Iw/tHSJjxR+v35L1G2FFg9dSTRs4l6AS
	OmFrnf1LtG0b8oN+z/F0uCXZkrEb8NSg36LulcnKcEd67BI939DwDQlOnfxrvyRZzSBZJXUL5LH
	Kt0ETdANmrTpLtz891CXuKiRfNXtdsl25py7iTnk0AuCQtjTdz/rQf7zAjyn3NW0tsQ==
X-Gm-Gg: AZFdTZfZ/7ZAHBWqqlf7OcqNktpco//z4wISihS9XlwTD0pPz1n1LXspizNay2/dmSd
	knKRB+/B9J1dMTIhdMgfopqNZFGbFVuhyEFyyTWikCfk0jasN7XfTWF5udkeGmpz3XiZ/DLpazN
	yvGQCrHHVbhC1JTKeRQs3kWqQkCY9AofA9MhUeRYib4Xh4YtSC+fhmmb4KYTZqF82a360QvRzLn
	ydGjc9uqsIIjWiARvC+O1zAjfgkBRyTqmRjInbPNd5S4hbFPiHZpDT9P8QIHLiwGkMK97giNk3y
	1gZOxeHwz7rS5wIU3Ki0sBGP85snIGRmM0f8nAJu1QI1SERs+AxJLCZQ/lHAXP85hgLEM21sbS0
	ibk8e5TiNaswO7iGeMVGJQyFQ4jBSRWfvvt4sO9o/MUeLteAKvBCr5nkT1UsfA53WMXea4eJ399
	fJ3I5tM+29H9UtRa2qb4BrV5SfZUo5uBSGfrAGnY8vf2xxKHzb1wR7NXYtcEaGHE1gcyRF43Qc1
	FtjDfEk4J1+nzMjNl497JW/wK3A
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr3047814785a.17.1795601970013;
        Wed, 25 Nov 2026 02:19:30 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr3047810585a.17.1795601969406;
        Wed, 25 Nov 2026 02:19:29 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:25 +0100
Subject: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b06b632 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=TtxWlH5-b3U2hsFWeNEA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: rTVHEJchCPbUd6BcbbypZx5yLJvLIAXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX+14gv7V+BwHh
 Na+qZXchIq156CKWq57G/y/6yf0Weiqa1pTM+pWEhjnqW71SA1hncU9LXh5vZj3+Q80OXW6E9NM
 qBm3pIiCem+UYYTs5zBGzQIdydiXFr2zXNUQVCTm8C3ojHqlQyqylDLNsCDkvJSClefnT6AIY1y
 qI3ioOaQPplZoZ5FEduna/Fn/WfPVKAA4Qy9Jht+gIU8vjYUIkB1c0rNLlVY3NE0/toGFO7h7qF
 whmWP4MBC8IPGbfdepKsmXiopqCgReCWz8HqA4Z7vCuSxuV+PLEsXNMGFDIhr8qc0sb114BnEvj
 w/RhiMZl786APfPTKWPh0MaaL0Bo1y5bzshi2vKhySwk/HDRRaLiiOqA6dL6kV0d/UBKU7YFfMZ
 sk4ChjLg/vXxOaYQeFzlXrADdrO47rgkvLuz6qO6GpMd5IgucwBrQXcTToFHjCK1uEgcUPjweIN
 G1B2MSESsq4xpEvxk1w==
X-Proofpoint-ORIG-GUID: rTVHEJchCPbUd6BcbbypZx5yLJvLIAXu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX7HjiRCX+O0Kl
 tANEac1MHQzDtixFVvx9WfbP2MIMtNwhZduPBfRNWIaxXyoMQY9x00bhcYHP9OzCz04IhQuarAo
 S9ksdKyfmp4JCn9dbNuTGiQyHFBszks=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250040

The timestamp reported to userspace for a V4L2 event is taken when the
event is queued, which for an event signalling a hardware occurrence is
only as good as the latency between the two. A CSI decoder able to latch
the start-of-frame against the system counter knows that time to within a
few microseconds, whereas the interrupt handler that gets to queue the
event can be hundreds of microseconds late and is not consistent about
it.

Take the timestamp from the event when the driver filled it in, falling
back to the current time when the field is cleared. Drivers have had no
reason to set it so far, and every in-tree caller either uses a
designated initialiser or memsets the event, so the field reads as zero
everywhere today.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
 include/media/v4l2-event.h           |  9 ++++++++-
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 	wake_up_all(&fh->wait);
 }
 
+/*
+ * Hardware able to timestamp the event itself reports that time in the event,
+ * which is more accurate than the moment the driver gets to queue it. Fall
+ * back to the current time for the drivers that leave the field cleared.
+ */
+static u64 v4l2_event_ts(const struct v4l2_event *ev)
+{
+	struct timespec64 ts = {
+		.tv_sec = ev->timestamp.tv_sec,
+		.tv_nsec = ev->timestamp.tv_nsec,
+	};
+	u64 ns = timespec64_to_ns(&ts);
+
+	return ns ? ns : ktime_get_ns();
+}
+
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
 {
 	struct v4l2_fh *fh;
@@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
 	if (vdev == NULL)
 		return;
 
-	ts = ktime_get_ns();
+	ts = v4l2_event_ts(ev);
 
 	spin_lock_irqsave(&vdev->fh_lock, flags);
 
@@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
 {
 	unsigned long flags;
-	u64 ts = ktime_get_ns();
+	u64 ts = v4l2_event_ts(ev);
 
 	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
 	__v4l2_event_queue_fh(fh, ev, ts);
diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
--- a/include/media/v4l2-event.h
+++ b/include/media/v4l2-event.h
@@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
  *    fields. The other fields will be filled in by V4L2.
+ *
+ *    Drivers whose hardware timestamps the event more accurately than the
+ *    moment the driver gets to handle it may also fill in the timestamp
+ *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
+ *    drivers must zero-initialize the whole &struct v4l2_event.
  */
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
 
@@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
  *
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
- *    fields. The other fields will be filled in by V4L2.
+ *    fields. The other fields will be filled in by V4L2. As for
+ *    v4l2_event_queue(), a non-zero timestamp field is taken as the
+ *    CLOCK_MONOTONIC time of the event.
  */
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
 

-- 
2.34.1

