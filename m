Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98438B7B4
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786473021; cv=none; b=lMaKxSsXLDkjmW9OH4wkG/9NITQsZ7h/l6j35XpaR1OvO3md/OnMPvFtOYNkTrbrklrBcbyVEXVuyt3Ewu14gjuyA8UdQwBpDt+CmQaE2YDo8M0BxyDCFSVH5nr5wqWuyfxwld/HgfZIJXLL8V3LtQovTWEsPPNMiaXF9aoG0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786473021; c=relaxed/simple;
	bh=7/mfk8byDdoQBxxoyQQHHh1kxMA3Od9D3QpJFrj3Mjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OP46rjnCJhiriDr7QBmJ6hVtnpIdJtLc3uIDt3jcnqm72+h8COLPLHo3iPCz9gKdaeSBCwIp61tyT5RuRXuSm4CHZNlL4V1j/NCoeeiQSfBXbgvALhYvgTyBI/oIuwbtf9+co3A4ZGeRR/VCieE8AkLJRuD+6cEYHSy2yo4nu5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OteIXH4R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LxJTtkUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OteIXH4R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LxJTtkUY"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BGOHD81170038
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3fqy9f93f6DrZhjxQqNdKYqt5gbpVbD4h+k+ApYKkA=; b=OteIXH4RDKQy60RR
	O+VIu+2vM6GuS7islSDiN6kL/0UK4eR1QUg4db3ekJfHq8f8LK7lbAOPuyjj5rvB
	tbOwoOifcnN7X7jbs6y1DZ/fxtB+O41MQpDcaCcSVX9hcSvyuH5ifavK9M6VuQpq
	su7L44j8ojuz9f66ovcGJGqMwBU59y2Su37y+vfLs35zzE9c2oqmJc5eum1PnNcC
	zD/Qs32P91zcmh1XN9BzhwzNhgIiy5/qHkvaZHnz/JGsUNMrT3cuyhMz9qOi53bJ
	sykM8aJtsDWztyyACzWvB+MVRNrk2y15ZPoigmh9MoH9Lx0VOpjf+QXSPc75D2HD
	40Na3Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc22v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 18:30:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d01666c1b3so532295ad.3
        for <linux-media@vger.kernel.org>; Tue, 11 Aug 2026 11:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786473017; x=1787077817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3fqy9f93f6DrZhjxQqNdKYqt5gbpVbD4h+k+ApYKkA=;
        b=LxJTtkUYVzhDYYKbDs9b8TIZQ2lSE+U5x9hf2ozT48DgjzFsge6R/XhXEGSLHvJHzQ
         y87N7sx15mI21y9kxSqAelzzmmaIanXJjh2wGhgdvm4yH2KMPGJUdXsLY63ZWfn4gLXU
         igxBov/JNGV+5Wa+InzZgDr0eIxIPlqw559j03TAwQTpORXCkIaVAL0XDHYAdkmrw9uY
         Bb1O/C5O32ASLaO+VDBdTQNowdjtBcoTjXC62zdZYFzUXDGj1DKo3pCjNcMbIT5cm1KO
         dt2e+LwRTRFqM4ronJKEBIrQYD5Dl/fabomPgJ06Uo8nRFgTYLl4f8bCyMIoVcWVU2j4
         Wr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786473017; x=1787077817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3fqy9f93f6DrZhjxQqNdKYqt5gbpVbD4h+k+ApYKkA=;
        b=a362KgEyGt5D0UKnKxU+KnV6QhJPkOHZPHyZQoWg1tFbH8OqHDf+JhLf6RM100eOI+
         TXBEiF0zZ8gyHDs5tS+V2Ix6sF519tH/ZVSYImWSEmcpOqq7/wgJmXFEhRUAJvwWUkj/
         m/KB8S5kCw948tmL4KM/iZNTvbBbXiwMPQZDWceYYEjqxradaR3nXQqEQRqLh8uyuPRR
         h51hBa117gw4WyXFh9iB5x13o7LBYs5i5BfRFBXgaiMaHRGJKjTeaLGRbesgykE/gBgG
         Bf0WdPPY2QpvYYVqvj7cKqpCi+L6z+vNBtBVlnluhsTbOvfCFIQr454SwnykNGh414qE
         gxfw==
X-Gm-Message-State: AOJu0Yw7UlfQHdDcNj26r16sgXqriJ8mMEpBqx0Q1WV/q0qWjJ9AvwoP
	3Z900Qq+I7uEyDLR3j8boU4t2kv8kdRl9Bl/5WGBmLw8Js4fcx7dN1XbCkXIs6PJwXrKF57NRge
	XES9M7P5KYmsLSs+9ei3UEA9Wy7D31ahIUSUiGQbIbJ+vQP1OTRgPy+GbWql1b3JTdA==
X-Gm-Gg: AR+sD10Od+67/tV9Es9i31BhunidTeLNgabsLOpGLqJ2vDXCp7QSEesE2uMMBa0x0eE
	/ZzGGYVahZ2LbSfFJQvWNzy+1zswu5jPMy2CR85XPHKD6zD5mvhw1930bYUFcE72pR+ilI8SLmy
	M26mftiqCSKG1KMjBTxKWYq//zuX+kx1QLT0LkezkFjHOV2CxeXhcgOWQz5idMxTooOq1/DJ+Cz
	pehSp1tA6KGwRK1sZ2dtT11PiRZweAVoxgdJ2EWbtQvhaafD55WN6dPV84Hi685mNeTRo1BpCcV
	AoqA3ZYWbpMxqC4m1DdXRL1y/0w3Ft3EQJxFYxaywOJgSBb1WRnQlUckAaiTsLNGHzNi+5+Xrn2
	FLJOiZuW0FUP8c8SvrrjyWlKPo+71QL+mUxudbJbY8EueW/Bf+LKKitefVMCE
X-Received: by 2002:a17:903:b0e:b0:2d0:2741:f31b with SMTP id d9443c01a7336-2d31794d71dmr42995365ad.4.1786473016682;
        Tue, 11 Aug 2026 11:30:16 -0700 (PDT)
X-Received: by 2002:a17:903:b0e:b0:2d0:2741:f31b with SMTP id d9443c01a7336-2d31794d71dmr42994895ad.4.1786473016222;
        Tue, 11 Aug 2026 11:30:16 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315d829c4sm11759955ad.0.2026.08.11.11.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 11:30:15 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:30:10 -0700
Subject: [PATCH v4 5/5] media: iris: Add BUF_ROIMB_DELTAQP metadata buffer
 for ROI delta QP
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-enc_roi_enable-v4-5-1c9ea2405bb8@oss.qualcomm.com>
References: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
In-Reply-To: <20260811-enc_roi_enable-v4-0-1c9ea2405bb8@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786473008; l=9821;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=7/mfk8byDdoQBxxoyQQHHh1kxMA3Od9D3QpJFrj3Mjk=;
 b=u7AlKPiMf94/M6iq+kqrs3oR4+6Lj5m2zEnculNAt3GJptsHvVtXjf6pfFkMS2OgrdK+BsiOF
 QQ46VK25QKxDSUsVDzVTbLwA6CwdqfviQ8s2OnYUo8YAJtVhdMRsV1z
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX1jJYztJh6t84
 G/ChGu43oq8Pv8lUNdMrAwpHeQlJFRFAlPNGyMtSG0OR5MOEnzCdLxtJnGKyDV6cS1GG0zgvW9e
 AvoR6HYEGldY1Psbr2/TLaX0CvjGx0I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE1NSBTYWx0ZWRfX0YnBePJEayqw
 QVj8oR0j59TeyoENC7AetiXQuBnjx4UYeUl+KfdgGnmpWfDx12lkaIFuvXoFvixKJvK6F7wpCGC
 l39/4qOuzPljR5VPlwM5WhZMzaEcxm+gxO6f7wqu++gCLh8FIvwqLMEqJWGatvHKcGfqLSsibWa
 gnHwJr2IET3nVZQA/C7WmYHVMe4pgXL595CppV4vwmChsXaNzNN8QqOkOOxAZ7rg+YZnK8Dh2td
 Yv/6n7JrWqJ9/lP6jdtCM7FJyV82e6L1inCbmJY4uwxyL8oHiaEWAYyo0gBXF5NlpHK3eBBYdOO
 zge8njFaPvlz83YDcx43cjTdCbI/OWcEXgQQ6/Tk6h2HolcUMfeEcSqJv8BxpNz7bGQbZh18vDs
 wPIgCD/GCp+cmb9tZE2W8mpuMAk/k2FoayRr7NJwkfzxRcV+8XogKPNltBCYGuIiECH+BqFMA4f
 OtHDmwpXCcL4KWvNq2Q==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b6a39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=JBFbhGGVFNGgHyVnUDYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: 6hksfIMYTDOJ3EBwM6faymLmZgswg6qe
X-Proofpoint-GUID: 6hksfIMYTDOJ3EBwM6faymLmZgswg6qe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_04,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110155

- Introduce BUF_ROIMB_DELTAQP as a new internal buffer type to carry
  per-macroblock ROI delta QP data to the firmware. This buffer is
  allocated on demand when the application sets ROI parameters via
  V4L2_CID_MPEG_VIDEO_ROI_MB_DELTA_QP, and is queued alongside each
  raw input buffer as an HFI_BUFFER_METADATA packet on HFI_PORT_RAW.

- The metadata buffer layout follows the firmware-defined metabuf_header
  and metapayload_header structures. The s8 per-MB delta QP values
  supplied by userspace are widened to s16 as required by the firmware.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c     | 98 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_buffer.h     |  4 +
 .../platform/qcom/iris/iris_hfi_gen2_command.c     | 23 +++++
 .../platform/qcom/iris/iris_hfi_gen2_response.c    |  2 +
 drivers/media/platform/qcom/iris/iris_vidc.c       |  2 +
 5 files changed, 129 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177f5e1ab83b90a3c8c80e0b4d1f02e..e7283a5054f685741bb55d5545a6c11188861b5d 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -5,11 +5,13 @@
 
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
+#include <linux/slab.h>
 
 #include "iris_buffer.h"
 #include "iris_instance.h"
 #include "iris_power.h"
 #include "iris_vpu_buffer.h"
+#include "iris_hfi_gen2_defines.h"
 
 #define PIXELS_4K 4096
 #define MAX_WIDTH 4096
@@ -705,6 +707,19 @@ int iris_destroy_dequeued_internal_buffers(struct iris_inst *inst, u32 plane)
 	return iris_destroy_internal_buffers(inst, plane, false);
 }
 
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst)
+{
+	struct iris_buffer *buf, *next;
+	struct iris_buffers *buffers;
+
+	if (inst->domain == ENCODER) {
+		buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+		list_for_each_entry_safe(buf, next, &buffers->list, list)
+			iris_destroy_internal_buffer(inst, buf);
+	}
+
+	return 0;
+}
 static int iris_release_internal_buffers(struct iris_inst *inst,
 					 enum iris_buffer_type buffer_type)
 {
@@ -928,3 +943,86 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 
 	return 0;
 }
+
+static int iris_fill_roi_data(struct iris_inst *inst, struct iris_buffer *buffer)
+{
+	s8 *p_array = (s8 *)inst->fw_caps[ROI_PARAMS].p_array;
+	u32 array_size = inst->fw_caps[ROI_PARAMS].elems;
+	struct metabuf_header *mbuf_hdr = buffer->kvaddr;
+	struct metapayload_header *mbuf_payload_hdr;
+	s16 *p_16;
+	u32 payload_offset;
+
+	memset(mbuf_hdr, 0, sizeof(struct metabuf_header));
+	mbuf_hdr->count = 1;
+	mbuf_hdr->size = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+	mbuf_hdr->version = BIT(16);
+	mbuf_hdr++;
+	mbuf_payload_hdr = (struct metapayload_header *)(mbuf_hdr);
+	payload_offset = sizeof(struct metabuf_header) +
+			 sizeof(struct metapayload_header);
+
+	memset(mbuf_payload_hdr, 0, sizeof(struct metapayload_header));
+	mbuf_payload_hdr->type = HFI_PROP_ROI_INFO;
+	mbuf_payload_hdr->size = array_size * sizeof(s16);
+	mbuf_payload_hdr->version = 1 << 16;
+	mbuf_payload_hdr->offset = ALIGN(payload_offset, (u32)256);
+	mbuf_payload_hdr->flags = 0;
+
+	/* Firmware expects 2bytes of delta_Qp, int16_t */
+	p_16 = buffer->kvaddr + mbuf_payload_hdr->offset;
+	for (int i = 0; i < array_size; i++)
+		p_16[i] = p_array[i];
+
+	return 0;
+}
+
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst)
+{
+	struct iris_buffers *buffers = &inst->buffers[BUF_ROIMB_DELTAQP];
+	struct iris_core *core = inst->core;
+	struct iris_buffer *buffer, *first_buffer, *next;
+	bool found = false;
+	int ret = 0;
+
+	if (!buffers->size)
+		return 0;
+
+	list_for_each_entry_safe(buffer, next, &buffers->list, list) {
+		if (buffer->attr & BUF_ATTR_DEQUEUED) {
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+			list_move(&buffer->list, &buffers->list);
+			found = true;
+			break;
+		}
+	}
+	if (!found) {
+		buffer = kzalloc_obj(*buffer);
+		if (!buffer)
+			return -ENOMEM;
+
+		INIT_LIST_HEAD(&buffer->list);
+		buffer->type = BUF_ROIMB_DELTAQP;
+		buffer->index++;
+		buffer->buffer_size = buffers->size;
+		buffer->dma_attrs = DMA_ATTR_WRITE_COMBINE;
+
+		buffer->kvaddr = dma_alloc_attrs(core->dev, buffer->buffer_size,
+						 &buffer->device_addr, GFP_KERNEL,
+						 buffer->dma_attrs);
+
+		if (!buffer->kvaddr) {
+			kfree(buffer);
+			return -ENOMEM;
+		}
+		list_add(&buffer->list, &buffers->list);
+	}
+
+	first_buffer = list_first_entry(&buffers->list, struct iris_buffer, list);
+	ret = iris_fill_roi_data(inst, first_buffer);
+	if (ret)
+		return ret;
+
+	return ret;
+}
diff --git a/drivers/media/platform/qcom/iris/iris_buffer.h b/drivers/media/platform/qcom/iris/iris_buffer.h
index ee2d24bb69c57220b0a735d9b4aae4434a33daf6..df9d018493f3ec37fd5e6b0ba049dba0b5ae76e9 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.h
+++ b/drivers/media/platform/qcom/iris/iris_buffer.h
@@ -28,6 +28,7 @@ struct iris_inst;
  * @BUF_SCRATCH_2: buffer to store encoding context data for HW
  * @BUF_VPSS: buffer to store VPSS context data for HW
  * @BUF_PARTIAL: buffer for AV1 IBC data
+ * @BUF_ROIMB_DELTAQP: metadata buffer for ROI MB DeltaQp
  * @BUF_TYPE_MAX: max buffer types
  */
 enum iris_buffer_type {
@@ -44,6 +45,7 @@ enum iris_buffer_type {
 	BUF_SCRATCH_2,
 	BUF_VPSS,
 	BUF_PARTIAL,
+	BUF_ROIMB_DELTAQP,
 	BUF_TYPE_MAX,
 };
 
@@ -139,5 +141,7 @@ int iris_queue_buffer(struct iris_inst *inst, struct iris_buffer *buf);
 int iris_queue_deferred_buffers(struct iris_inst *inst, enum iris_buffer_type buf_type);
 int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf);
 void iris_vb2_queue_error(struct iris_inst *inst);
+int iris_hfi_gen2_session_alloc_roi_metadata_buffer(struct iris_inst *inst);
+int iris_destroy_roi_metadata_buffers(struct iris_inst *inst);
 
 #endif
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index c08926609a3b7f5bb63df369da519accdd490121..070335dba173231c191d0e5842d6e226a057aeaf 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -134,6 +134,7 @@ static u32 iris_hfi_gen2_get_port_from_buf_type(struct iris_inst *inst,
 		switch (buffer_type) {
 		case BUF_INPUT:
 		case BUF_VPSS:
+		case BUF_ROIMB_DELTAQP:
 			return HFI_PORT_RAW;
 		case BUF_OUTPUT:
 		case BUF_BIN:
@@ -1267,6 +1268,8 @@ static u32 iris_hfi_gen2_buf_type_from_driver(u32 domain, enum iris_buffer_type
 		return HFI_BUFFER_VPSS;
 	case BUF_PARTIAL:
 		return HFI_BUFFER_PARTIAL_DATA;
+	case BUF_ROIMB_DELTAQP:
+		return HFI_BUFFER_METADATA;
 	default:
 		return 0;
 	}
@@ -1349,7 +1352,27 @@ static int iris_hfi_gen2_session_queue_buffer(struct iris_inst *inst, struct iri
 					     HFI_PAYLOAD_STRUCTURE,
 					     &hfi_buffer,
 					     sizeof(hfi_buffer));
+
+	/* check if any metadata buffer is available not queued, queueit */
+	if (port == HFI_PORT_RAW) {
+		buffer = iris_queue_metadata_buffers(inst, BUF_ROIMB_DELTAQP, buffer->index);
+		if (buffer) {
+			iris_hfi_gen2_get_buffer(inst->domain, buffer, &hfi_meta_buffer);
+			port = iris_hfi_gen2_get_port_from_buf_type(inst, buffer->type);
+			iris_hfi_gen2_create_packet(inst_hfi_gen2->packet,
+						    HFI_CMD_BUFFER,
+						    HFI_HOST_FLAGS_INTR_REQUIRED,
+						    HFI_PAYLOAD_STRUCTURE,
+						    port,
+						    inst->core->packet_id++,
+						    &hfi_meta_buffer,
+						    sizeof(hfi_meta_buffer));
+
+			buffer->attr |= BUF_ATTR_QUEUED;
+			buffer->attr &= ~BUF_ATTR_DEQUEUED;
+		}
 	}
+
 	return iris_hfi_queue_cmd_write(inst->core, inst_hfi_gen2->packet,
 					inst_hfi_gen2->packet->size);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
index 84b629b957442c024dccc18b354ac9a7e541abaa..f63e0a7723e8583da818c2b004e367c1dd3d94f7 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_response.c
@@ -58,6 +58,8 @@ static u32 iris_hfi_gen2_buf_type_to_driver(struct iris_inst *inst,
 		return BUF_PARTIAL;
 	case HFI_BUFFER_VPSS:
 		return BUF_VPSS;
+	case HFI_BUFFER_METADATA:
+		return BUF_ROIMB_DELTAQP;
 	default:
 		return 0;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index fcbc60016beec693f2ce27927a09a2d51494bc38..fae3d113a9dc990f06167ee0b7fb8fab24a0552c 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -180,6 +180,7 @@ int iris_open(struct file *filp)
 	INIT_LIST_HEAD(&inst->buffers[BUF_SCRATCH_2].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_VPSS].list);
 	INIT_LIST_HEAD(&inst->buffers[BUF_PARTIAL].list);
+	INIT_LIST_HEAD(&inst->buffers[BUF_ROIMB_DELTAQP].list);
 	init_completion(&inst->completion);
 	init_completion(&inst->flush_completion);
 
@@ -299,6 +300,7 @@ int iris_close(struct file *filp)
 	iris_destroy_all_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	iris_check_num_queued_internal_buffers(inst, V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	iris_destroy_roi_metadata_buffers(inst);
 	iris_remove_session(inst);
 	mutex_unlock(&inst->lock);
 	mutex_destroy(&inst->ctx_q_lock);

-- 
2.34.1

