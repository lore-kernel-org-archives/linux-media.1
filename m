Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC09F4CE66A
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789509632; cv=none; b=PMwBcPgooayF78RMuhEo5cJEjU/DWkgYx2mc/jefJ7dm2V4O1nN5F7SFbzfZnMTkbnI3qMXNiSdTfXoiqODHWC5pzdTfy3d2tRxCddbU6k3CW4GKTpgIlTvbJdARbtpv+dWX6wGGawasdOXKkGO4YAcQksMRLXJxMKqbT2Im2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789509632; c=relaxed/simple;
	bh=W4KJ4/cRaUhT4aJPGYQieyDy2CUuHLjA+S4NcGfr9rs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O+1eF/AV4t7zW1QHy2MC8rpydFe7TNeSTsQ6Nzqd+37b5EU17YqcKsVDyobkvR3ss/7kJ/c3sItRAvFSODUIZdRRVT5JctWMBpeKHiJqpWVPncZi8B9dFmAcCW1k5BAumYSfu9245/bAY4cNUktiMLhB7n7v1Wmi5b9crTPB0WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JsOLdaCJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AacoGLv7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JsOLdaCJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AacoGLv7"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZAFi080109
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtVMWvUgXxinKbJf6CgTIuBPkLjW6igzz8lufb5j0eA=; b=JsOLdaCJawHWoth9
	rXp4rVyWVsW+0tWEyeRNr+wWV0PryHx/0O46w3CadQRwtcQJ5S8GdmAlP1ggGzqe
	WjimjKzmUhX5idJZPIAMiSh7zbkvUTUBLRRR2O7YRBk3XpYbD448EiSugnI3akFy
	uL8hXqbLcaYedeZXooYt4re1S6n6MNU2A9M7q/3H7xrum49FKj2NENW65eVBWfp0
	oxKDub8FhtNVJBP7CtHctR6zxsjFkDO1Y5YE0BAuaIaf3Nr9i36Rd/EMY/SkMXUl
	p42BD1jmdWtqitRIghMzOWNirYHtqkZXidjg8Y3yKJku8tv1LfXTtuFPcaMwO4fl
	ZBk0xA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageh31y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 22:00:12 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384d033f7f5so1149493a91.1
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 15:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789509611; x=1790114411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XtVMWvUgXxinKbJf6CgTIuBPkLjW6igzz8lufb5j0eA=;
        b=AacoGLv7hYGJ7l3H3wvF4XMUmiDB5Ld+PXP21VA8g8ErGb9uYxHeYdj7uwEOQCEro2
         vnRwnt/Ay981yaA8NVXfdpV2qBxukSL1dBVls3WmkgkluyrSOWJjps4vkLLnpweUvLE2
         bCWf5EJG/5Qrk01EvfhETw2KrPR85bHzBaglj8uHQe/rWP3Bdrk4C4v6isGsjCvPEI8w
         5hxWCuwveoE8DkF5cCciH2Y22a8cEJInX0d9tihl5dJ1+qeWKO0wUbIR5yN6ITqf4a0a
         llpw5dyZNYwsxPNMhBdtLoxgz/y5JdqsMreDjMqss0raZgzwB5hMRgXw+1hDc+uEGOWq
         xd/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789509611; x=1790114411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XtVMWvUgXxinKbJf6CgTIuBPkLjW6igzz8lufb5j0eA=;
        b=e/3cVKjNBoxcM5OWV2+rjDxLl96joT5CK0H/NmEcjTYL0imtaTjUbIspRbnKHR9I0n
         a5OLKlBdofNlNxKz39bkQFKdYJymSmRXIexsBbiixkttt9jfq0koCx1vz1Y0LmpNZv3M
         OEJ1SH7a0RJdVVXh39O0nkPGW+eag1g2gUe8aAOKVfMsDnDmAcAzqFK1oN8+AF6tC+xp
         UMk7yeX3iXOEHXfxyow+eu/e78RMuqJPHCkewH9Q7k7vnDw5iUZ+vnGAIQEMuswM/8cM
         5Lb2y3qVdFOBmyuVxhhk1c7bO03iwWnCFPwKAzocPUrFavFWvkPsPIar0otPtNGtxKK0
         OuPQ==
X-Gm-Message-State: AFuF++lHsRuWv90GZfQapXT0VAM/7SSkCCeDSe1wAK87Xt8yEW0BHPk2
	+hiFIMgdtQBou4XQ4BJa+H+T9SutkcAnS6K6a4tuXFggfXFFKaMsXMoS4oeMV5TtKQCzaeyysVB
	aKEG0Jc8LUOHdjEKvwn00gU1MFMcwKHEdhqvGmDdCypgKokN7D/sWx/gRmuC6PwQvPg==
X-Gm-Gg: AYBFou1MY+2BdiVFnH/x2DK3mXoIMnqbF21GsKtU/U6Y8LwVKniYTRoAOzG06JqIQ4w
	G9yhbDmBYBI05LhG9/UB8JkjxBAK1RBtmYMLwoqRAiAw8FUC8QaDqBUUAYeRvLvBx/VGkaLZcks
	8X+f0ZBhZW3uV7gRdWgt9yicLJSjw9o+ZNZiRXGuZp3MU8v9j3fBONxcTn2HR/oh0HPgZU+GiIa
	W0QWmWunbJ+GJRf6c20AfXARUfWw7HX2RWNfjATYoXqfE1Nx+IKnqnpHvMFIZBT4g2tFDCGiJpO
	elzE/pStVESFxbefl0l2BrVZO+CMO4dkoFBdWXKbVnmHYePFxSaR8YbMkvtDfMWvw3IUfbbzGGH
	ylZMEPPZaSDvj4KkuXZPiYHDhDE1FTIVEOhvR6sLt85Ox+N3kQUQXKAicI1Di
X-Received: by 2002:a17:90b:2d45:b0:39e:207:9db0 with SMTP id 98e67ed59e1d1-39e1e50f7bamr334159a91.4.1789509610679;
        Tue, 15 Sep 2026 15:00:10 -0700 (PDT)
X-Received: by 2002:a17:90b:2d45:b0:39e:207:9db0 with SMTP id 98e67ed59e1d1-39e1e50f7bamr334099a91.4.1789509610061;
        Tue, 15 Sep 2026 15:00:10 -0700 (PDT)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1e38sm1878345eec.16.2026.09.15.15.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 15:00:08 -0700 (PDT)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:00:03 -0700
Subject: [PATCH v6 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-enc_roi_enable-v6-1-29dd4c8bccff@oss.qualcomm.com>
References: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
In-Reply-To: <20260915-enc_roi_enable-v6-0-29dd4c8bccff@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789509606; l=7252;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=W4KJ4/cRaUhT4aJPGYQieyDy2CUuHLjA+S4NcGfr9rs=;
 b=cT23WPwPBFBwl1zrstEkdc05Si+qxjT4R8ehCGTjnqZWQLyNIFJSkcMWpqw4hZ3mdINj3m+fw
 qaP3Gw/n2qZAeBvk8X/r4EwJkxFNoV3rM0pzGC2XjxG0bhdB+JAUHVH
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX9R7YIk4OjWmA
 Y9Vbyqo9U80OkZkmxQQ9HMOddDz11XGAPlKzwWb0Dpft15udzddjN4SQz4FiNxwp+BYWEYJYsC9
 iKGhB4Pbs3wP2oQJEJAt2lMWXLbzcAc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyMSBTYWx0ZWRfX8GA1q0+47H4n
 /ky7Y/GGdGCEfwo8x/JkEi8SfvrQ0ulaUASZ4ytvEdJlNfJBA0laQs/nuX7ZoALwC2NQxd1uWJd
 juVmXCrQO8bakyAwjVnW5yeyLRmxu3DlyvhadvtgZuAw7a1fQsXTYa+KB7ER5HI0QQme8HhE5o5
 M2BKtr7Y6pM9XoP6DBF8XTw/vKAvNZuHush21VFSP7Kacqj/KhMeu9YKCpY8msAf8NBXxNiDH/Z
 EG1lonZoEtzmAR0MCK6zVcj1Njli+dRpCqsMKTR+mAqDffqyQcMzGAcgUCv57FZ69wzCpf7O2Sx
 MIMgXM/ogD2BMl2l7fHLFCufOiE3et21xQhE9jSKnOMLESCVTd+bK8gAS9pXRzUI8N+/rXROSaF
 K42sS1FhM7wogh38ZSQJY3liXeqahn+hNXQSFe1zVffRFIj1NVJ+aH1GW4Gtjub2wqQonks6DTe
 +gcqV7hkSZrUMsqS4TQ==
X-Proofpoint-GUID: rai4DnQM3wDDBjN8fJkq_rYSnwjF0j77
X-Proofpoint-ORIG-GUID: rai4DnQM3wDDBjN8fJkq_rYSnwjF0j77
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aa9bfec cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zatfZSFVlCmks967f3wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150321

Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
control type for signed 8-bit values. Add necessary support in
v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
v4l2-ctrls-api.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions        |  1 +
 Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst  |  4 ++++
 Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst    |  6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                      |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                     | 11 +++++++++++
 include/media/v4l2-ctrls.h                                    |  2 ++
 include/uapi/linux/videodev2.h                                |  2 ++
 7 files changed, 27 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
index 6182b4e2d2ee002c0d3562e1cc3bc2fd9c4286d6..b036ed3ec2f0744175cad1cbc4e73fe828e0c955 100644
--- a/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/v4l/videodev2.h.rst.exceptions
@@ -141,6 +141,7 @@ replace symbol V4L2_CTRL_TYPE_STRING :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U16 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U32 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_U8 :c:type:`V4L.v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_S8 :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_SEQUENCE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_PICTURE :c:type:`V4L.v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_MPEG2_QUANTISATION :c:type:`V4L.v4l2_ctrl_type`
diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index d78328152b7552f8f0d30a9e2f7c104bfd4b70d3..fe5f8992389c32d8f35f432229ef2f734002644e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -188,6 +188,10 @@ still cause this situation.
       - ``p_u32``
       - A pointer to a matrix control of unsigned 32-bit values. Valid if
 	this control is of type ``V4L2_CTRL_TYPE_U32``.
+    * - __s8 *
+      - ``p_s8``
+      - A pointer to a matrix control of signed 8-bit values. Valid if
+	this control is of type ``V4L2_CTRL_TYPE_S8``.
     * - __s32 *
       - ``p_s32``
       - A pointer to a matrix control of signed 32-bit values. Valid if
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 82c8b52e771ce9301491b3f752e501a8fe7e2434..57e1652ae72e0324742142446acf32a16b94941c 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -425,6 +425,12 @@ See also the examples in :ref:`control`.
       - any
       - An unsigned 32-bit valued control ranging from minimum to maximum
 	inclusive. The step value indicates the increment between values.
+    * - ``V4L2_CTRL_TYPE_S8``
+      - any
+      - any
+      - any
+      - A signed 8-bit valued control ranging from minimum to maximum
+	inclusive. The step value indicates the increment between values.
     * - ``V4L2_CTRL_TYPE_MPEG2_QUANTISATION``
       - n/a
       - n/a
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-api.c b/drivers/media/v4l2-core/v4l2-ctrls-api.c
index 93d8d4012d0f4fef004e417d0aee2ae44b1b30bd..7d41cfd7378baaa929d4da0266c45f731bb54285 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-api.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-api.c
@@ -980,6 +980,7 @@ int __v4l2_ctrl_modify_range(struct v4l2_ctrl *ctrl,
 	case V4L2_CTRL_TYPE_U8:
 	case V4L2_CTRL_TYPE_U16:
 	case V4L2_CTRL_TYPE_U32:
+	case V4L2_CTRL_TYPE_S8:
 		if (ctrl->is_array)
 			return -EINVAL;
 		ret = check_range(ctrl->type, min, max, step, def);
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 9caca56478d1a97ccde582a2086e7039411b52ed..b78992e32e21c79b1c70ec673b81759c9ca84206 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -297,6 +297,9 @@ static void __v4l2_ctrl_type_op_init(const struct v4l2_ctrl *ctrl, u32 from_idx,
 			memset(ptr.p_u32 + from_idx, 0, elems * sizeof(u32));
 		}
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		memset(ptr.p_s8 + from_idx, (u8)value, elems);
+		break;
 	default:
 		for (i = from_idx; i < tot_elems; i++) {
 			switch (which) {
@@ -377,6 +380,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_U32:
 		pr_cont("%u", (unsigned)*ptr.p_u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		pr_cont("%d", *ptr.p_s8);
+		break;
 	case V4L2_CTRL_TYPE_AREA:
 		pr_cont("%ux%u", ptr.p_area->width, ptr.p_area->height);
 		break;
@@ -1442,6 +1448,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
@@ -2037,6 +2045,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_U32:
 		elem_size = sizeof(u32);
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		elem_size = sizeof(s8);
+		break;
 	case V4L2_CTRL_TYPE_MPEG2_SEQUENCE:
 		elem_size = sizeof(struct v4l2_ctrl_mpeg2_sequence);
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 327976b14d50b73a631e4d2ed95d9f4d146c45ab..9a68a3555e349f1e55aa01af5c10f08201d62bae 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -27,6 +27,7 @@ struct video_device;
 
 /**
  * union v4l2_ctrl_ptr - A pointer to a control value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
@@ -61,6 +62,7 @@ struct video_device;
  * @p_const:			Pointer to a constant compound value.
  */
 union v4l2_ctrl_ptr {
+	s8 *p_s8;
 	s32 *p_s32;
 	s64 *p_s64;
 	u8 *p_u8;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..ac588d0093df9cc35c11d0b9d41d052d5e800925 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1884,6 +1884,7 @@ struct v4l2_ext_control {
 		__s64 value64;
 		char __user *string;
 		__u8 __user *p_u8;
+		__s8 __user *p_s8;
 		__u16 __user *p_u16;
 		__u32 __user *p_u32;
 		__s32 __user *p_s32;
@@ -1961,6 +1962,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U8	     = 0x0100,
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
+	V4L2_CTRL_TYPE_S8	     = 0x0103,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
 	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 

-- 
2.34.1

