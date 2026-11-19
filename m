Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795088776;
	b=T3/3i9TlG45wikD2jFlbrIJSjRQDSKHpUW5Hh8tFa0xeOZttOzgcC/XcOjw0b7muzdJ8
	 czrJeI8DI2KwztYsK0ePNW9vi2gKznqEn7jwfBDmc/pt+BNxKjQVsQk2UaIuM+ROdwS8i
	 v+b7OXkmQpJAlwYxuJE7TBYN9Uwotyf3KpZmtmo93Z6jorSTkt+ixIz3a37uyrryS+4G0
	 /b3KGvxGVDFgwCTt+uULyzJKZpU5Ii7rwQfCREZf87gNYuK0yUG3DJ4y8mvbw6VQaa6iU
	 HMepAd+zCz+gMRdcAYCXytjSlhdovF5XPUrNqQtus2cagaNx7s3BBPyGT4CzW7Ec4Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795088776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OJyyP4iTPYTyi9xgdJ41fb0eee85MgjiZwpfNFv11C4=;
	b=P/HOv1o/km6grqEDw4KTu8341Qvs9zp9t+6oVV4Hy7OfHTwiTUAzMgbbyjqQpL01BR5v
	 VhppXZYocz1UhhNAP2BzXtEyZRSqVW/9dWLo1dw34m4F3QiyttoIYR7785otAK75+jGU6
	 ELoOc4ICmV4wuNR4a/nmxn1Jxo1LGa9y0/KKkZnwjKy7WUbrK9S55kZTOC/o5onjAQGbU
	 DpEyxRKT8DWRKnuAsK8rhfgP/bbhln6Kw71mhkKAcOXJo0p7rYbO9kGKWzTiMRgJylrfG
	 EPyyMXDnm2R9GAH1hEcEX45v6rug2ephkwMZ+2Gi5SLzA95IRcaMHKsAHvNIIcDpW8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="UMcCpu/W";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MtJiyAPC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5CD606A336
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5CD606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UMcCpu/W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MtJiyAPC
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBirUN2681570
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJyyP4iTPYTyi9xgdJ41fb0eee85MgjiZwpfNFv11C4=; b=UMcCpu/Wfx5OKgUX
	IJI8Jnka6yFgjmhiw14gPJaAhZzklt8VBsn0BOmisyQCkCL43kLQLOeHn+SnNf07
	tW+gR5FtHv8KHm+AUwJupexcLR6xyZ76gpmsi7TAQo3Y1eBxiIM4DUs/xv5mjlx8
	TTcUzz6sEL/l0AjVjfeysEtylfFcaTuHPl4K34ojA7lagpi3ifyQLshgtb0yaD5+
	NyJxTvap57SoTLdZ8O0a+Q3HOhQytd/GcKWi+VslS9vPJMEEzoS+CGJq/CLVWtvE
	IuSC8aHlWZGMlidzpsDqAuZulualmiHHyGQ6R+Ut2QDqJ2NKwXnb1qSQ5yKIZWw/
	Voz3Qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j20gu805n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 11:46:14 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cdb86c39250so1353713a12.2
        for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 03:46:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795088773; x=1795693573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJyyP4iTPYTyi9xgdJ41fb0eee85MgjiZwpfNFv11C4=;
        b=MtJiyAPCSAvrQ0WqvWJpvafv23tEVgoXih5MTuH25pvbhNp8KC0KuSTgAGvf5G2RNP
         ucd0asjfTr8xmQPl+Whl7RtKZaPfLYOGhTLuEDENu41ttOfkQ4vAa+Z/AaBqa7o1yxY4
         HUH+liRPkWIV1y6NzqMjIKkBGkmPBBMaGoP9UJniX/e+v+5wTn3rS7Y9oTSZpbi18VvF
         weEgD5ku+0cUX5iqK7Sx+JiuJmSOF9470bjoaVZBW77nEpK4PUCq5oMUbNY7qaf6Yx3O
         3vZ2NRf0jvFbPue467uNEOIjhzu0ZqIBXlsqfAhloUUZKLpgtsyzlcPrUO/KAnO6HNAW
         uyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795088773; x=1795693573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJyyP4iTPYTyi9xgdJ41fb0eee85MgjiZwpfNFv11C4=;
        b=iPDk8Ey+1GFq4+hiMpqEidMzxlFEFBVayupw9lVpt9zcby8wAF+cJyFniSfFNOfwcg
         h/lX4Kf+S37CQcXkv1kFYgtTJX+PnaztAZzXWxOoCXXiU7VGhGtS44KjK2fXq+Nkhjz3
         jJdgDQ9es0So3oHhjW+Va0wPkMzFg2/ID5wLiVaUddCDp5kGKvx9gcByNJ8YO8SoL8CU
         uKEIGorfQ6VT13jC6TzTD7Lgx7fUaqUyBgyDYXpKlhzrmorR/sYB1/1Q7B2U3DzFMNGx
         Gw3fjVnb9ix/g1Tqr8uU7RSSMhMEnl1vR1xnULOmEHW7A/qoNapKchIyrJBB+nNq/+iJ
         4EGA==
X-Gm-Message-State: APuU4Z/9p0ajimRpC1CgMm+i213t/lo3qSQNz0oealZkYXtCkGLVMjqO
	ZPEnJ7f87ZdV6zQ8XLsXE7+V1mm3LCypVpzL5LOV6pyy2ZN+p5c1zeH20/uDHynBHiF2VxQ5Nrb
	s4Kk5UVw6+WUJURuz9RIHrIKPA6UIRWYOKb0Jungz+qGTtx9PzIwCp2Fpk+yolIAkHQ==
X-Gm-Gg: AZFdTZfM2Ld242o5c8muoti/hWlVmpc41hXQtpi0HjmoWhVnO8xBlLBXLLWvetV7E3p
	jDTYfUhbjnVc5xQ09aztWF/w3IgB9OSaTZ9SOp2f/etbl63KnX1iZKDE/qouZB7N12G5zcb1IuV
	lJDAyZdH+0lFksirmXBxibC+J+m1zXgE7gDnU/msbDEnlDJMB6EwYlkNl9A934der9cksW4cIK1
	a9mHap161uLLAntpsY910W+/QeiXhw17pUY+KS6Mrb9bbVswmwXU5da25AO5bRCAzCX5k3NNpGa
	h4Z1tTdRxRxCz/YXYtw/s1zZoXqM9VAkBqwGhJZ5s1v1wgAuL3ZEuucxWytIqlBRACWAOLVxSHk
	SpIEcgMOkCYn5riz1WqZ8rW0G2W+m981hKHKfhwM0L/8SN5nIxzazOfnqoRoJ1Ye9sRyV1bZ9Jo
	9KW3OZS1c=
X-Received: by 2002:a17:90b:224c:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b3d07d84ecmr5366021a91.49.1795088773149;
        Thu, 19 Nov 2026 03:46:13 -0800 (PST)
X-Received: by 2002:a17:90b:224c:b0:3b0:accf:5c66 with SMTP id 98e67ed59e1d1-3b3d07d84ecmr5365994a91.49.1795088772570;
        Thu, 19 Nov 2026 03:46:12 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm2397030a91.15.2026.11.19.03.46.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 03:46:12 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 17:15:32 +0530
Subject: [PATCH v3 3/4] media: iris: Fix use-after-free on unbind with open
 sessions
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
Message-Id: <20261119-iris-handle-unbind-v3-3-52d467a13907@oss.qualcomm.com>
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795088753; l=11006;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=iX4erwszKEzdSuxW+kBjVUmMK3FdxvpKEB1tXr/Bgbo=;
 b=BBcLhTyLZ7f3bLnXQZSHUbkUkHmrg3xfKhFFJ19zeHugnBsQSNN00/tnP0YR5E0HR2GRJuadM
 Xm/oNuhtswMCmm5N8C4DygEXx7WOtgGa0Z8onlVYv0rXb2SZxogh0aP
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfXwjDpwwX2j89s
 8hAm2lTrtHsjCY7pHVX1dJCv+mfUweWcBsG3ltkwv33A/BzFy7VHFwzodW01VPd9Hk+Wssi57fp
 3Jj8ns2qzbS/dducL8EAaa1eJSBvfms=
X-Proofpoint-ORIG-GUID: Yz7zY6kSEAchhRZI5cKUYkfBDwKiIzuD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA0NiBTYWx0ZWRfX99lY8LUjGaeK
 +EmHbXHsdtKs+kkirY3r21u7cAQ9i1yZdBdTZAnklKH1lzBsAyV3HBvl0B+zdqk+XMFX7oFl3Or
 rI9H4YLldO5x8B519NCN713FeyAkHzQ53L/Y/kLfsTNNVv/pw9u6Bjd0KMMjGXmHKZ/eZK59uOl
 X8+AIpk12DLupQDEE+96/gT8KRiMPlxSc7JTMWVTCiaVr3AkakZv6S/XNEZE/AkVf9WWoS/fzze
 sT1PHHo5Gm9ppzamIkTooGUla37aB66r//amhafOZ5C75xG+CEEobBnrZqt8ojHfr0xbHU5/Y53
 C7q5v1rTo+NGat6d1AeKc+PUZDJf4YM/fJArcRcH8RvFO1HOOYihDpazeYJG8vDsWSnqRWlb3MH
 QKpaABbXoTmeC7/vRubZIUb/90koYQHUUryg+J2pBGvpJjpHOkv+JVRv2F0f0rWzELop/L3Bm3m
 ozQOz1VVkJ2YuhTA4dA==
X-Proofpoint-GUID: Yz7zY6kSEAchhRZI5cKUYkfBDwKiIzuD
X-Authority-Analysis: v=2.4 cv=XutvqlF9 c=1 sm=1 tr=0 ts=6afee186 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g5Mknvnlwd8Y4dGn3oQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190046

The driver can be unbound through sysfs while a client has a video
session open. The core is devm allocated and freed when remove()
returns, so the open sessions then use freed memory.

Only the core structure needs to outlive remove(), because it is the
only thing the file operations of an open session still use. Allocate
it with kzalloc and tie it to the reference count of its v4l2_device,
which every registered video device holds. It is freed when the last
file descriptor is closed. The other devm resources (register mapping,
response packet, clocks, power domains, interconnects) are only used by
the power on/off sequence, the clock and bandwidth votes and the
interrupt handler. All of them are released with the unbind, after the
core is shut down.

To make sure nothing uses them afterwards, set a removing flag at the
start of iris_remove(). It makes core init, new sessions, command
writes and the clock and interconnect votes fail with -ENODEV, so a
client still holding a file descriptor cannot power the hardware on or
vote for resources that are gone. A client waiting for the firmware
only times out and returns an error without touching them. Runtime PM
is also disabled explicitly in iris_remove() instead of with devm,
because its callbacks use the core.

Callers that hold a runtime PM reference, such as iris_open(),
iris_hfi_queue_cmd_write() and iris_scale_power(), can still be running
when remove() starts, as video_unregister_device() does not wait for
them. Take an rw_semaphore for read around the reference and wait for
it in iris_remove(), so that the references are dropped before runtime
PM is disabled and the unbind releases the resources of the device.

Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
Reported-by: sashiko-bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c      |  5 +++
 drivers/media/platform/qcom/iris/iris_core.h      |  4 ++
 drivers/media/platform/qcom/iris/iris_hfi_queue.c | 18 ++++++++-
 drivers/media/platform/qcom/iris/iris_power.c     | 24 +++++++++++-
 drivers/media/platform/qcom/iris/iris_probe.c     | 48 ++++++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_vidc.c      | 15 ++++++-
 6 files changed, 102 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index d558475986ff0..9c0a9a2e4be07 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -56,6 +56,11 @@ int iris_core_init(struct iris_core *core)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	if (core->state == IRIS_CORE_INIT) {
 		ret = 0;
 		goto exit;
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39a..3aeab49600e4a 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -62,6 +62,8 @@ struct qcom_ubwc_cfg_data;
  * @iris_firmware_desc: a pointer to the firmware-specific descriptive data
  * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
+ * @removing: set when removal starts, blocks new opens, commands and votes
+ * @pm_ref_rwsem: ensures runtime PM references are released before removal
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
  * @iface_q_table_vaddr: virtual address for interface queue table memory
@@ -108,6 +110,8 @@ struct iris_core {
 	const struct iris_firmware_desc		*iris_firmware_desc;
 	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
+	bool					removing;
+	struct rw_semaphore			pm_ref_rwsem;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
 	void					*iface_q_table_vaddr;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_queue.c b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
index 545bbe75e1740..482369f5fe037 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_queue.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_queue.c
@@ -130,11 +130,25 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 {
 	int ret;
 
+	down_read(&core->pm_ref_rwsem);
+	if (core->removing) {
+		up_read(&core->pm_ref_rwsem);
+		return -ENODEV;
+	}
+
 	ret = pm_runtime_resume_and_get(core->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		up_read(&core->pm_ref_rwsem);
 		return ret;
+	}
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		mutex_unlock(&core->lock);
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	ret = iris_hfi_queue_cmd_write_locked(core, pkt, pkt_size);
 	if (ret) {
 		mutex_unlock(&core->lock);
@@ -143,11 +157,13 @@ int iris_hfi_queue_cmd_write(struct iris_core *core, void *pkt, u32 pkt_size)
 	mutex_unlock(&core->lock);
 
 	pm_runtime_put_autosuspend(core->dev);
+	up_read(&core->pm_ref_rwsem);
 
 	return 0;
 
 exit:
 	pm_runtime_put_sync(core->dev);
+	up_read(&core->pm_ref_rwsem);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_power.c b/drivers/media/platform/qcom/iris/iris_power.c
index 91aa21d4070eb..77395754a1dc8 100644
--- a/drivers/media/platform/qcom/iris/iris_power.c
+++ b/drivers/media/platform/qcom/iris/iris_power.c
@@ -47,6 +47,11 @@ static int iris_set_interconnects(struct iris_inst *inst)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	list_for_each_entry(instance, &core->instances, list) {
 		if (!instance->max_input_data_size)
 			continue;
@@ -56,6 +61,7 @@ static int iris_set_interconnects(struct iris_inst *inst)
 
 	ret = iris_set_icc_bw(core, total_bw_ddr);
 
+exit:
 	mutex_unlock(&core->lock);
 
 	return ret;
@@ -83,6 +89,11 @@ static int iris_set_clocks(struct iris_inst *inst)
 	int ret;
 
 	mutex_lock(&core->lock);
+	if (core->removing) {
+		ret = -ENODEV;
+		goto exit;
+	}
+
 	list_for_each_entry(instance, &core->instances, list) {
 		if (!instance->max_input_data_size)
 			continue;
@@ -92,6 +103,8 @@ static int iris_set_clocks(struct iris_inst *inst)
 
 	core->power.clk_freq = freq;
 	ret = iris_opp_set_rate(core->dev, freq);
+
+exit:
 	mutex_unlock(&core->lock);
 
 	return ret;
@@ -125,11 +138,20 @@ int iris_scale_power(struct iris_inst *inst)
 	int ret;
 
 	if (pm_runtime_suspended(core->dev)) {
+		down_read(&core->pm_ref_rwsem);
+		if (core->removing) {
+			up_read(&core->pm_ref_rwsem);
+			return -ENODEV;
+		}
+
 		ret = pm_runtime_resume_and_get(core->dev);
-		if (ret < 0)
+		if (ret < 0) {
+			up_read(&core->pm_ref_rwsem);
 			return ret;
+		}
 
 		pm_runtime_put_autosuspend(core->dev);
+		up_read(&core->pm_ref_rwsem);
 	}
 
 	ret = iris_scale_clocks(inst);
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 6f02bb629867b..57185dc432ebc 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -243,6 +243,22 @@ static int iris_register_video_device(struct iris_core *core, enum domain_type t
 	return ret;
 }
 
+static void iris_core_release(struct v4l2_device *v4l2_dev)
+{
+	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
+
+	mutex_destroy(&core->lock);
+	put_device(core->dev);
+	kfree(core);
+}
+
+static void iris_core_put(void *data)
+{
+	struct iris_core *core = data;
+
+	v4l2_device_put(&core->v4l2_dev);
+}
+
 static void iris_remove(struct platform_device *pdev)
 {
 	struct iris_core *core;
@@ -251,18 +267,26 @@ static void iris_remove(struct platform_device *pdev)
 	if (!core)
 		return;
 
+	mutex_lock(&core->lock);
+	core->removing = true;
+	mutex_unlock(&core->lock);
+
+	video_unregister_device(core->vdev_dec);
+	video_unregister_device(core->vdev_enc);
+
+	down_write(&core->pm_ref_rwsem);
+	up_write(&core->pm_ref_rwsem);
+
 	disable_delayed_work_sync(&core->sys_error_handler);
 
 	iris_core_deinit(core);
 
-	video_unregister_device(core->vdev_dec);
-	video_unregister_device(core->vdev_enc);
+	pm_runtime_dont_use_autosuspend(core->dev);
+	pm_runtime_disable(core->dev);
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
 	iris_unreserve_iova_region(core->dev, core->iova_state);
-
-	mutex_destroy(&core->lock);
 }
 
 static void iris_sys_error_handler(struct work_struct *work)
@@ -281,14 +305,22 @@ static int iris_probe(struct platform_device *pdev)
 	u64 dma_mask;
 	int ret;
 
-	core = devm_kzalloc_obj(&pdev->dev, *core);
+	core = kzalloc_obj(*core);
 	if (!core)
 		return -ENOMEM;
-	core->dev = dev;
+	core->dev = get_device(dev);
+
+	core->v4l2_dev.release = iris_core_release;
+	kref_init(&core->v4l2_dev.ref);
 
 	core->state = IRIS_CORE_DEINIT;
 	mutex_init(&core->lock);
 	init_completion(&core->core_init_done);
+	init_rwsem(&core->pm_ref_rwsem);
+
+	ret = devm_add_action_or_reset(dev, iris_core_put, core);
+	if (ret)
+		return ret;
 
 	core->response_packet = devm_kzalloc(core->dev, IFACEQ_CORE_PKT_SIZE, GFP_KERNEL);
 	if (!core->response_packet)
@@ -354,9 +386,7 @@ static int iris_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(core->dev, AUTOSUSPEND_DELAY_VALUE);
 	pm_runtime_use_autosuspend(core->dev);
-	ret = devm_pm_runtime_enable(core->dev);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	pm_runtime_enable(core->dev);
 
 	return 0;
 
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 05aab6e3005d5..4c9961206f9b7 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -64,6 +64,9 @@ static int iris_add_session(struct iris_inst *inst)
 
 	guard(mutex)(&core->lock);
 
+	if (core->removing)
+		return -ENODEV;
+
 	list_for_each_entry(iter, &core->instances, list)
 		count++;
 
@@ -162,18 +165,28 @@ int iris_open(struct file *filp)
 	else
 		return -EINVAL;
 
+	down_read(&core->pm_ref_rwsem);
+	if (core->removing) {
+		up_read(&core->pm_ref_rwsem);
+		return -ENODEV;
+	}
+
 	ret = pm_runtime_resume_and_get(core->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		up_read(&core->pm_ref_rwsem);
 		return ret;
+	}
 
 	ret = iris_core_init(core);
 	if (ret) {
 		dev_err(core->dev, "core init failed\n");
 		pm_runtime_put_sync(core->dev);
+		up_read(&core->pm_ref_rwsem);
 		return ret;
 	}
 
 	pm_runtime_put_sync(core->dev);
+	up_read(&core->pm_ref_rwsem);
 
 	inst = core->hfi_sys_ops->sys_get_instance();
 	if (!inst)

-- 
2.34.1

