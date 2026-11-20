Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795218310;
	b=vJ8HaLfT1g7COXB5YCvOGgQWDHgR9tF7JUib98LIAyJDdIptNvYSuGSSSyqZvHfMnf+F
	 GdY7n6dgdbFCN//ODoQIAICqEBgpU3Mepeaklt/sCvI/u5X0Q14UOZZudZaJDyZkhAVkg
	 3bxbyNGELXiNv90X/kpT5K7Rk7ZEJ7s/UIoMM4U66qId5gygtC4VxUYIWm9SCwYe+2EEs
	 sZdt6O0qFXiwO3/gDgIZPsaNgwEE7hueG/88MI96Xa1d0MUpkCGWqNQfLrdFrCZFbcdT/
	 4n9DnvTocxywkWeY/xREWVmfDegdiKsjyCh+Ovvbqgl7rwThbHNQI22Gj7MUnkiUJuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795218310;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=;
	b=NoiL5NABkej6WnMWvggDPFyPK3H5xo3MjOB2yKO02+EMcu8YQzf2xq1InFICl6aFavVJ
	 uyCPzmnzU4i39lKAPTKAN1S2dOkSs3Cn4NBKjh31ZNILiK+eLTeb8ScvATcC/JMhFZrb8
	 ukM+mPQKbbVnLEIpNyR1S/a1grjOhUsb79PbQSmsTiAmAgDobn5vOahIiC6T8lp1EH6vO
	 wXh0cRe+1OBJDyAHF42ONNSiJbmDBy/KIVTgf0cxvpA8sRSCPGx7OsjCIPwX7/I+PvPCd
	 X+c8WeWINZqlRXmE7rATUfXep9yNod1FKTeeJvzm1kmI+6oWjJxYnqTvj4jstS0L4EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A1ROPQJS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cz+8Zhlq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEA9606A6B1
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EEA9606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A1ROPQJS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cz+8Zhlq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKJlAgH3619353
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=; b=A1ROPQJSIT7Yvjvz
	+RbtqweFq9ag4eI+5Q/GEfuyavb2lWTDlHKJs+9dXSfikVGAVQOCFSrkGL1//hbS
	lu8vTeOSa4b4o4g9qf8ohID6scKVHp/6O4+/4xQnZpZL2W3cVQWMUqZRNKSe5o40
	L/dkWCwcdC/gnEbr5/oan+D5W3C0Bo/i5PEpAQUM6ZieM83XdBXh25LZXkrOyQsE
	hQcDKnihu//mqOtJ3a+c6BhZD6VBUVjUzrDiMYJZWIkYFXp1HOA9o/M4mFcBYL+j
	Nz1dAUwRKf0GziiKcbA7I/R9L90OsH6M4paWytJulUIvpGSoaTU/3XI9qM4v4Zr2
	dCXIiA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2vnx0pay-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 23:45:08 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3838b531addso144509eec.2
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 15:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795218308; x=1795823108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=;
        b=cz+8ZhlqvHL9LqNohY9pBkU5tWHjDbZp53h3KiQ+OjMorpwJZYnrBl4Fqe8rMiBgKn
         MA7Bvz57spWkEPjwb+U7jlvsZBrbgxs6c5hhOJyzdJhpuf21K/ZDLIKfX0TW5P3yJ0dS
         N6bwSu9y/fDK8prhycrcq04sCvuY2O3yao+e7Rvz8ioG1AQx5Pb11AHZkfwvYxq71p1t
         xJ9r9k8K8aSkGQssGcUExyz32Ec0hnGcVW0neZv79b9jtaphsRiO6kLzxcfjanAbTuY9
         zBPZLcChtx2s5n27rbLlYrZPrs1xI1AiR6ix4/tLAbs6LiGlt9ShNt79LpbOflsnYwnj
         KGqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795218308; x=1795823108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OxdmP1ZXt/82Gla2WZmw+ibuDRz0VJj44iHjvcbW1Aw=;
        b=pqvj4NtSwho1UgLrJhfNL8F8g0nXHjXtXKEE7W9ESUUSrNA/VZ16IO8uFcBsScvON/
         8FZDAwnUp2RO864Bg6IqLazzXVQYyW7BCs+xrKzmoj0xZUUovWnNkfgSEvKcMjTjWvXd
         4fVnhv54F1z5BKLv2ouTbmyJTLlep948Ga+L/PgXR3O96T/U23yDa9GP7L5/Q90Bc/G2
         z/KSvp2xEM3mKBAHV0bjYq+KWVyFNp35W/cOjcbnw2J9hUcP6dsKnoLr52B2BPtyHBAe
         Zzi5YyNzDNFIXXusO1qoCS+DQH4ywBjXg/05wlWyrXOiLcuRrp10TOsSyTRLYOcfad0k
         LNdg==
X-Gm-Message-State: APuU4Z++KI3cU3Gq0MWWuCjAF9floTXgYeMRxe80gBkFQQ/i8hQnghEq
	K/Du6N/961VX9FrqfNk/8Nl+N0vDSjvJCeHrrFGiXpKbPv69Nn0g2Ggu/pNKptFEx2/2D0t1YuK
	PCY3OBrvoTwmfbDLCqOoqPMYq0Jzczty40flb8VjawO7R6fSheo+Xr1Z6eOanmMcc3A==
X-Gm-Gg: AZFdTZfyULbaKJeNKD+TVAH8vaThbOj+mGxaYlmWK0eaNxrQ4h13V6uX0TQ7gMGZMgJ
	w2WDxmo32TmG72RFPm4GDFobJECPTOBmCyDp/pQg2GjmDDFQx/48HwZQOrYFY41Om3K0YBbsA7E
	ZJAfkP+vMYGygGfpq9BN6Qej0MXDVT3bxAQPy/fKI0/uAkoIa1yZBhx0lBG3tRaNUjFmh9JsMYk
	vZpNfP5qTyN8Em3iKsIx2POxl77oOjPwGmqIs8TSr1CKwurEF7+QkJJ5KNwNxLKOsNMFZkE0LDf
	WcibYdXDeazZg32knTvOBskdh9iLYIXwdUkb+4iuFCEnsyDg464lre30o1HNqo9ahs58VfrmMmT
	lX/JS8VTyrCI9fQ1chWFKnV2A56F0N8wyTtHsniRQgbmptODQX0fym9Xe4XAMRQtZUYsQ15ToDm
	KwtIoP87+q7K/Cn+Ic+wTSVwwKewQO1taZqg==
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr5568381eec.1.1795218307322;
        Fri, 20 Nov 2026 15:45:07 -0800 (PST)
X-Received: by 2002:a05:7301:b8e:b0:377:d6e5:e642 with SMTP id 5a478bee46e88-3856e245b2fmr5568339eec.1.1795218306741;
        Fri, 20 Nov 2026 15:45:06 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm14669862eec.4.2026.11.20.15.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 15:45:06 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:45:02 -0800
Subject: [PATCH v11 1/5] media: v4l2-core: add new control type
 V4L2_CTRL_TYPE_S8
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
Message-Id: <20261120-enc_roi_enable-v11-1-c00b95ea1b81@oss.qualcomm.com>
References: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
In-Reply-To: <20261120-enc_roi_enable-v11-0-c00b95ea1b81@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>,
        Hans Verkuil <hverkuil+cisco@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795218304; l=8019;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=3h8pZyNAgbI1LK8jhQfbBWUCKbwZ0GlgMNvlszeKfko=;
 b=CKexUMnttwB579fAWgiv/xx93lRDppNinEY0mUuvuxjc+9Y9XYGBPh+4BeE1uGjLRAmSeETa8
 Cej5sWUBRR5AJ1wCk6IeMzCz/a+PnOkYQcBMOWglpSSsJCW1fwlQ587
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX1HRvd2+UG3Hd
 7UZ4Q7Y8snhu/7DKP4ud6K9775m2OX8Eq88MeDDHYMVBihB0hPI10bfxEyUfR9cL0j58N5eYLSd
 ccpSsv7DBGATSQZhTFFg9fSEvc3saQFxHNxzowJNXKNonGQNqie78twaGJ4IepK4TPwFIypwYFV
 po+SLuHivQjkpC025/QonwoDf202rsAnyCriBlTcw/ETMfTiAJd/yCssEossgkcEwm3Unc7OxVU
 2XRoTfxyG3I8kQIX76ZER3q7L1zwLxF9gQeK9MGGidgE39iNGBpUakkdgIF/bxYJy387HGKwDJ9
 HV1MaP34GNsQaPtsVBzmL69q6Xh6Kstyq4ODusDUeVTvH3vrJ0t/kI3Pdiicqlxr9LrrwEaia19
 V2L82aJxs/w8I/11sQsm8dHWrUANiem3rWpAV7lnqkVR5WmJCF9v8NmUHPjriy205Vvr5YjunXh
 OpLigbasbUxgnJS9rMA==
X-Authority-Analysis: v=2.4 cv=SbRi5fRu c=1 sm=1 tr=0 ts=6b00db84 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZvH2QzoBumBvrUatZloA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: lOhqoW1Y486oUEpXlVwDvDs1XVAHU5iA
X-Proofpoint-GUID: lOhqoW1Y486oUEpXlVwDvDs1XVAHU5iA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA5NCBTYWx0ZWRfX/2tiR+Ij+zBc
 pI5SNy3Fz51kEGd/k9xLNQlclObmAS/MCgRmkmwOtmB0LEi+9oexDaerkg+OdradfAvqET+79Pw
 Vos3A8tNBzUekOtS8Se/XMqqeEhmZLA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200094

Introduce V4L2_CTRL_TYPE_S8 (enum value 0x0103) as a new
control type for signed 8-bit values. Add necessary support in
v4l2_ext_control, v4l2_ctrl_ptr and handling in v4l2-ctrls-core,
v4l2-ctrls-api.

Reviewed-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 .../userspace-api/media/v4l/videodev2.h.rst.exceptions   |  1 +
 .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst       |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst         |  6 ++++++
 drivers/media/v4l2-core/v4l2-ctrls-api.c                 |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c                | 16 ++++++++++++++++
 include/media/v4l2-ctrls.h                               |  2 ++
 include/uapi/linux/videodev2.h                           |  2 ++
 7 files changed, 32 insertions(+)

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
index 6e751a043a210618fd7829df16e99e535e9f45cc..a34eb2a21abafe7b0f1e9509939edb9fbedf8030 100644
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
@@ -1474,6 +1480,8 @@ static int std_validate_elem(const struct v4l2_ctrl *ctrl, u32 idx,
 		return ROUND_TO_RANGE(ptr.p_u16[idx], u16, ctrl);
 	case V4L2_CTRL_TYPE_U32:
 		return ROUND_TO_RANGE(ptr.p_u32[idx], u32, ctrl);
+	case V4L2_CTRL_TYPE_S8:
+		return ROUND_TO_RANGE(ptr.p_s8[idx], u8, ctrl);
 
 	case V4L2_CTRL_TYPE_BOOLEAN:
 		ptr.p_s32[idx] = !!ptr.p_s32[idx];
@@ -1533,6 +1541,10 @@ int v4l2_ctrl_type_op_validate(const struct v4l2_ctrl *ctrl,
 		if (ctrl->maximum == 0xffffffff && ctrl->minimum == 0 && ctrl->step == 1)
 			return 0;
 		break;
+	case V4L2_CTRL_TYPE_S8:
+		if (ctrl->maximum == S8_MAX && ctrl->minimum == S8_MIN && ctrl->step == 1)
+			return 0;
+		break;
 
 	case V4L2_CTRL_TYPE_BUTTON:
 	case V4L2_CTRL_TYPE_CTRL_CLASS:
@@ -1764,6 +1776,7 @@ int check_range(enum v4l2_ctrl_type type,
 	case V4L2_CTRL_TYPE_U32:
 	case V4L2_CTRL_TYPE_INTEGER:
 	case V4L2_CTRL_TYPE_INTEGER64:
+	case V4L2_CTRL_TYPE_S8:
 		if (step == 0 || min > max || def < min || def > max)
 			return -ERANGE;
 		return 0;
@@ -2069,6 +2082,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
index cec9217d97ac698cd447574f5d079dd913a9ef6f..cbda866197d894657b571ee5d57b4956818b7ee0 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -30,6 +30,7 @@ struct video_device;
  * @p_s32:			Pointer to a 32-bit signed value.
  * @p_s64:			Pointer to a 64-bit signed value.
  * @p_u8:			Pointer to a 8-bit unsigned value.
+ * @p_s8:			Pointer to a 8-bit signed value.
  * @p_u16:			Pointer to a 16-bit unsigned value.
  * @p_u32:			Pointer to a 32-bit unsigned value.
  * @p_char:			Pointer to a string.
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

