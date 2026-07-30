Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412FC416CF4
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455344; cv=none; b=uJZDu+FghBDVQgD22A13l/nmw+OqUPh57GM/fu0zWLldyJuSear00/a2IJi2RVULCurZuNPVp53e1/mpnodLjnKETLhBiqQRX8x4wHYnlxfGhcJx96CwqU6UNUHC6aIo4zDn+4B4lE6rceG1eUpm9wpULKeIE6LGarEI4As8YiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455344; c=relaxed/simple;
	bh=Gg9iPDAjFfgIzLpyI46MUBUdqccwqP3lg6opdo6zSCY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKoO9pXutugoa3kZat48Az+KRnrAUgyX7ro1il16Lcr+YnohCaO9/xQNFxINhtKqK5cKioNffM71kh9st5e1nn0jzIj4vh6MUvGy9CbgUQx6TymsaORl07JidGK80glC+feXY5rYQ6RepAJn8E8ldGKuOHXkxc9llU0KakNQ12k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e/jWFRxX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fm4/0+5L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e/jWFRxX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fm4/0+5L"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UNJkhE3439900
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:49:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iNV8r+3D95mRhh/1Xz93P866EBGrDBxQgjelh4q/yuc=; b=e/jWFRxXspFzAsgq
	pVQKT367/CBJ7H4S4ZLXLTzsIPjR3cygghggtKA1wMTf5A0QUiIKxQCVUaOGbSTJ
	8h84vHZz5XTe/wQ+9sONsw0af5sCmW+J684uC9KYWgvXx+aLUGVzCad4dM8uIZbo
	eGGcpKaWD3dOpdZZQglgdyiQgTOW/Nph+7VBnHkj36Y1VUEfxM9tLYRNv5lmup79
	tmtOeNKYlg7R/uFi/Ivur6SP32UQjQdQ/16PM1Wf8iacoDZCRSXxbs01sB2sTjxa
	+AtsanPmwJpL22D44wjQz01b0+RpLgFOzHvqH0ZUrMI78Dz4ZEDpbx9SKWcur+gu
	YgRmbQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frg6kg2bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:49:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso3226581cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455341; x=1786060141; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNV8r+3D95mRhh/1Xz93P866EBGrDBxQgjelh4q/yuc=;
        b=fm4/0+5L/vc/VCqIT0xwlQpFZpCxjSyMSO1OvLoq9rpKRBvc9kIggl+J6jwbHmZFEg
         PG+7aCwwvfYsY4McNDrfgLO1AXXLZI6g/VOHKYwk12nOV7G882ytes0ARJA5uQjEMPbe
         4ne8HT704HLPVByjDifzA01uJKMA09usYtDTdhdW1UGOARaxJ/Yv6ec7+uKWVmhn69qT
         RO45xdOmQPKDHikXsUfQJ1GKi0hw69umLHEtgUffIUbHV9BCpzARyl4jwGj8l1QnzgU3
         R4Cget6uzkD3nm4yW7ooPH+24WWMnRxsTfWUXAIRwm2jSJ91iE/VPq3aSKobhCqw2TBF
         9NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455341; x=1786060141;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iNV8r+3D95mRhh/1Xz93P866EBGrDBxQgjelh4q/yuc=;
        b=S55MS2PMZuj9/j+8QaXbRLkpC63401J0UgHu3CsOV3+CqtZAesimXMXySWXLKWtPNV
         MFai0KRh46PxKwMmRogxnCvnWHFEPC+vzJj02WlZjJChPuRh5+930cR0HNx0zwqNCUaE
         vnpsrokZpUfnfyRX2y+rTQISyjDN5ORzQbHj+i2FUCBLBuD6znYl+DbeDFxfOZNJNX3d
         B2luiUgvagMDl0KPZg9LJVLgihPA2MpYnQhRgmybAuPdP4YznSEKEHLiIQJkjP5aWeTW
         HI/0LBhzZ01lRezocOv7XHE9MQD99/m0NEl52vI/2lr1lpnxThWz3407rPgNZnw9SDfV
         s9Ow==
X-Gm-Message-State: AOJu0Yz+/1VeF3aS/KAweSBP8/9a8CyWTAoDIdf0aPB75obPGPzCymD9
	qfzISPvLuglAmCz1xtYzbFHWhjWTywNxivsIZNEDVWdSlXuJI1H7144R2OpRmlk+KWh63PLudYH
	BgBzMdwo/eOuZmwEltqTGzpuAXSVatwGN/4YJWC6aRJYHaBNzaDP7Z+hiELrbMj2XsQ==
X-Gm-Gg: AR+sD1355GzycuHUIu1CeudYFfyMelYfjdxfXfnSZ0I2Tp2ULxZP4KV5KDxVXpAFoPk
	O7Gvv8GC9lpahRicZ4LYrblWG0B3XMCq5iHrYAVy5q8pFjHjTn0SXc6+yLMcanghzHTSoKyuPeK
	FlGt95mUCUrEKzniAhARsbFs0PvOAysCWRXpVNVve0jyMtZ0s0mgSasJtjAfueqg0Qa1ehp24hV
	6Sg+oqqPa+YIpEzmzw1XXOm27CuVTXiOYIa2t7NLvC5XFyFWnrURB6BBptrjupaZhPsgboTTibR
	ZjwBziF+xxl93+0o52k0QnhjYUJAFXS/gWhwPsASQnhN3cPU6dpKmysMJMutU99+N0jqm45dhoU
	PzsxQ6LHChlyBJGKbWh7H4VtBp5WCfqpfaLTVzfTdFvw/k9M6dGRtjmbQ1Hotnl7fLkmP67BagK
	kiuEC17qmyFuY8sg==
X-Received: by 2002:ac8:5f91:0:b0:527:a5b:ea57 with SMTP id d75a77b69052e-52b38735a25mr49701311cf.85.1785455341502;
        Thu, 30 Jul 2026 16:49:01 -0700 (PDT)
X-Received: by 2002:ac8:5f91:0:b0:527:a5b:ea57 with SMTP id d75a77b69052e-52b38735a25mr49701071cf.85.1785455341068;
        Thu, 30 Jul 2026 16:49:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:34 +0300
Subject: [PATCH v9 13/19] media: iris: add minimal GET_PROPERTY
 implementation
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-13-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5856;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gg9iPDAjFfgIzLpyI46MUBUdqccwqP3lg6opdo6zSCY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1b2o9N6MR8l2Ze/nBkk1e80+VXhnssJ35auvKn+28blP
 NMckyWPOhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkeY09v+pHb/az+z6m7uk
 x9H0wivpvnzDnEV1Hzc9T/A5vPTZgfwcmeoL1sFRrz+FJN2OCN/pH6eSsf2KOM9PxuqPBedLPP+
 JcTDuWi94M9qxLvSwlfQ0253i72JKg5zU6/rPPtVIOy85VbQj1ys1OE7rsu3CerG2ub76dbIlhu
 s/xYns6w3j8DHXTeFlNv3X1W6y6XXGyqcX17UKafistnk472DOb4VVR+wiHh7KfJ5i/fjoJxdL4
 7T3e41azqrKTH2TFZXiYfJnjoyD9dSoHes2nryhIcmlIiEZ4FdvyftfSepET/Q+MdX0wp0n6xsc
 CqrkH63LOPSlpHten3ZL1+aN104m702PfO3rVOlx1bcAAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXzUL05N/Kp+0M
 M+56F4Akx+XmAFXPjXp62fptkhZiAkRzSMVTV9uWSzFxnLNlgwymIDld+2Axlxyvv88AqTvDp3c
 6UnYKT0Py9nfj+8LCJ6myk3QTF7CuQbhcBpjgiLHjJrBYC/GDzk8tazl+WSEXhOdWjqWTg13lub
 VtyuW7UqYRt7KQpeWLcZw3bskKjp+Sl34SB86J6k7ehfZgtny1pDcHVagw3UxKg3d/mZwngNIHs
 3lIPw77+mA4Y92/htOO7ZiMW+d5pGMuIRUbc3/JZMVmge7gj19TogetNtuY08AB+aQCBE7WiSws
 ZAUJJMXbYyeybYzwir9eCzytFtORlrHq/Yx7ZNuV/g5s3nKh3Qbz+Y4OFcshCULNZ+ktrit8hI9
 fu+QfdS/xSbGcVzjE86Ch51OzAUDkY/OTwkWDk8fEJG2MlULwTcPkz1/yDsHeoiwWcs3dA+1Bnn
 eIHfvhlHRHgEQSl7KOw==
X-Proofpoint-GUID: ICLCYoXM5BEcFNso867h5KvJNCQx0vFx
X-Authority-Analysis: v=2.4 cv=He0kiCE8 c=1 sm=1 tr=0 ts=6a6be2ee cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=O8_DsgnrxEnowPJBzLQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: ICLCYoXM5BEcFNso867h5KvJNCQx0vFx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX19TeBpccTKTs
 nqxA6mFtucaRU2adjW/uiEoi6CeKmiQqiu49prx3/90KzrKcuhMUjjUU6xuDpDVT01PYlZ/G9dJ
 ER9NB9nF0Q4Nv2Ue+fH4BDvMhxZOhaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

AR50Lt with the Gen1 firmware requires host to read
HFI_PROPERTY_CONFIG_BUFFER_REQUIREMENTS property, otherwise it doesn't
update internal data and fails the HFI_CMD_SESSION_LOAD_RESOURCES
command. Implement minimal support for querying the properties from the
firmware. It is used by one of the following patches, adding support for
Agatti.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_common.h  |  1 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c      | 21 +++++++++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_defines.h      | 15 +++++++++++++++
 .../platform/qcom/iris/iris_hfi_gen1_response.c     |  6 ++++++
 4 files changed, 43 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.h b/drivers/media/platform/qcom/iris/iris_hfi_common.h
index a27447eb2519..16099f9a25b6 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.h
@@ -121,6 +121,7 @@ struct iris_hfi_session_ops {
 	int (*session_set_property)(struct iris_inst *inst,
 				    u32 packet_type, u32 flag, u32 plane, u32 payload_type,
 				    void *payload, u32 payload_size);
+	int (*session_get_property)(struct iris_inst *inst, u32 packet_type);
 	int (*session_open)(struct iris_inst *inst);
 	int (*session_start)(struct iris_inst *inst, u32 plane);
 	int (*session_queue_buf)(struct iris_inst *inst, struct iris_buffer *buffer);
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
index f6e9cbfccd09..5650645f9f65 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_command.c
@@ -1120,10 +1120,31 @@ static int iris_hfi_gen1_session_set_config_params(struct iris_inst *inst, u32 p
 	return 0;
 }
 
+static int iris_hfi_gen1_session_get_property(struct iris_inst *inst, u32 packet_type)
+{
+	struct hfi_session_get_property_pkt pkt;
+	int ret;
+
+	pkt.shdr.hdr.size = sizeof(pkt);
+	pkt.shdr.hdr.pkt_type = HFI_CMD_SESSION_GET_PROPERTY;
+	pkt.shdr.session_id = inst->session_id;
+	pkt.num_properties = 1;
+	pkt.data = packet_type;
+
+	reinit_completion(&inst->completion);
+
+	ret = iris_hfi_queue_cmd_write(inst->core, &pkt, pkt.shdr.hdr.size);
+	if (ret)
+		return ret;
+
+	return iris_wait_for_session_response(inst, false);
+}
+
 static const struct iris_hfi_session_ops iris_hfi_gen1_session_ops = {
 	.session_open = iris_hfi_gen1_session_open,
 	.session_set_config_params = iris_hfi_gen1_session_set_config_params,
 	.session_set_property = iris_hfi_gen1_session_set_property,
+	.session_get_property = iris_hfi_gen1_session_get_property,
 	.session_start = iris_hfi_gen1_session_start,
 	.session_queue_buf = iris_hfi_gen1_session_queue_buffer,
 	.session_release_buf = iris_hfi_gen1_session_unset_buffers,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
index 275f3fea3d2a..6981e6e84fd8 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_defines.h
@@ -35,6 +35,7 @@
 #define HFI_CMD_SESSION_EMPTY_BUFFER			0x211004
 #define HFI_CMD_SESSION_FILL_BUFFER			0x211005
 #define HFI_CMD_SESSION_FLUSH				0x211008
+#define HFI_CMD_SESSION_GET_PROPERTY			0x211009
 #define HFI_CMD_SESSION_RELEASE_BUFFERS			0x21100b
 #define HFI_CMD_SESSION_RELEASE_RESOURCES		0x21100c
 #define HFI_CMD_SESSION_CONTINUE			0x21100d
@@ -113,6 +114,7 @@
 #define HFI_MSG_SESSION_FLUSH				0x221006
 #define HFI_MSG_SESSION_EMPTY_BUFFER			0x221007
 #define HFI_MSG_SESSION_FILL_BUFFER			0x221008
+#define HFI_MSG_SESSION_PROPERTY_INFO			0x221009
 #define HFI_MSG_SESSION_RELEASE_RESOURCES		0x22100a
 #define HFI_MSG_SESSION_RELEASE_BUFFERS			0x22100c
 
@@ -206,6 +208,12 @@ struct hfi_session_set_property_pkt {
 	u32 data[];
 };
 
+struct hfi_session_get_property_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 data;
+};
+
 struct hfi_sys_pc_prep_pkt {
 	struct hfi_pkt_hdr hdr;
 };
@@ -575,6 +583,13 @@ struct hfi_msg_session_fbd_uncompressed_plane0_pkt {
 	u32 data[];
 };
 
+struct hfi_msg_session_property_info_pkt {
+	struct hfi_session_hdr_pkt shdr;
+	u32 num_properties;
+	u32 property;
+	u8 data[];
+};
+
 struct hfi_msg_session_release_buffers_done_pkt {
 	struct hfi_msg_session_hdr_pkt shdr;
 	u32 num_buffers;
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
index bfd7495bf44f..23fc7194b1e3 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen1_response.c
@@ -591,6 +591,10 @@ static const struct iris_hfi_gen1_response_pkt_info pkt_infos[] = {
 	 .pkt = HFI_MSG_SESSION_RELEASE_BUFFERS,
 	 .pkt_sz = sizeof(struct hfi_msg_session_release_buffers_done_pkt),
 	},
+	{
+	 .pkt = HFI_MSG_SESSION_PROPERTY_INFO,
+	 .pkt_sz = sizeof(struct hfi_msg_session_property_info_pkt),
+	},
 };
 
 static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response)
@@ -652,6 +656,8 @@ static void iris_hfi_gen1_handle_response(struct iris_core *core, void *response
 			iris_hfi_gen1_session_etb_done(inst, hdr);
 		} else if (hdr->pkt_type == HFI_MSG_SESSION_FILL_BUFFER) {
 			iris_hfi_gen1_session_ftb_done(inst, hdr);
+		} else if (hdr->pkt_type == HFI_MSG_SESSION_PROPERTY_INFO) {
+			complete(&inst->completion);
 		} else {
 			struct hfi_msg_session_hdr_pkt *shdr;
 

-- 
2.47.3

