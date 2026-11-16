Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848764;
	b=uJk5u5hZkub0ZwdfK4rmMWT3rvjMWH5ITa6xg8lRthDL8M/SAoji6keyEOSUvYmRBSL/
	 WwIC4Fi12ETXZdHzKJa1BHHdGj+PiVbmwvsL8Ru/Hj8cxjCB9aa3qOr/AzsJWcn8tNHXK
	 y5Eh8fCjiywaHeSx8VjS4oUx3EJbzeinXHpdoegkRZ5N5viB0Q7vpJ3Gl+ueGwFcchSEf
	 FA0/Tc+iw9DVtw4CQvZqIw7RAHqN4pHhp7mQCwJeph6W6Icg9JmSFhlmr7BvzDo7Nptvb
	 h66cNE6w3Bk7tnxoV6xWNRhhx0Po8vdwp1eAVkNBPykzPNDxWYUaFEj1naYsOPrczKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848764;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
	b=lrpLxxnE+n1CPhH27GH8Q/mTup1eZ3ulQqjV+yswNq9bbuZa8UqugdFF5cobLrogZInz
	 0NWwKsUo1jbzU0+sRKHP4NdWEndI1S8tVAFnsf3RxwN/BAajit4uwdrDuCv47UJjb23HG
	 NuzksE7OfsJPBgxURRt7J916F+JR8lXcUWCUiopOHlfmMgKRWNgzJvFz1n3vet5ECAwvv
	 9FppwRiocZm33IZ6FSfNJNMHaVKRTK2FcQ/mef2QkRx384tA45+eEWVHBunhYtP3n4W+p
	 N/kABC3/3kL/79wnCESyDbQE5obKDlF/D/KHWym9AlPwTgMXXblnsu29ifhcg7GHDQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VtOKsDcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1j5AvC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE857606A889
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE857606A889
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VtOKsDcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1j5AvC
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGKAOu3693035
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=; b=VtOKsDcujsErv8Qq
	quoVGzJGfN7UnZq+ETy1SdDrNjoCzDsMu0o9AGakqqfAq2/IITlr+NNczdcJtiuL
	KbIrPLDEoM2ljJGXV20HCBXAgWIftFbr8t3AA13kfgUrHND5aoMcKd7jJHA8pTB0
	rkP6gAkDkui9pqGPi0YpIA02s8JQomDfym/537QNFI0Wogr67JkAwH0e741UoPun
	TuDJoX1rzIPcfMqs93EJaeNjZTmteEnG3z3Z/uPG0SB/MRtJyCkS4kz29xhHRRZD
	6Up3pqwegD99NqV5bEP4Pux5Fm26JGb3PXXl8Z5GHBZ2zdw01E/E/XmZqmQ78UCz
	Lekdkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f815x1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ed00709df0so33855675ad.0
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848761; x=1795453561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=ao1j5AvCJzN8kgsZFGlGjAuc2oDizawReYiYFSi7id3yx0H0kb2aDw7rIeZ1ghsqZp
         /306bZIzBGRi9z6+xyvWulP/vAWRyQc1Eftjtkb+vEPQs3CU2k1YyoG7KR+KwFhoPjU0
         jSCcrKy2t1DNDCC17XLpRCHJ9VtaKJkSfp3aNA+4k5kqw/879zap34eQqItZAGw8nzPf
         8BnJ3BaC0VapI+xuDK0mQbrZS7SJpXDoPuHoSUJE4lDfJfTjc5dR5SuWOtPu+oYObq6Q
         fr77K7/gHR9WT+Kc8viaDVvnWohCeGwKO5ES5D5cCJ7JMGarhLB/Z302m9/ZUrC0XlDD
         6HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848761; x=1795453561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=SBfxoC+YcbtMqrtAfE4XimXdya6+jlHz08kMkpuxQ0hDdeXNcILa+MYl7+njGPDhRY
         Alfh8nGLCicY+d3MvJg3iIAwdaqNHwYIodv2YCwdjuv92qPkRlRpy0v0wfyPc/9DNHDE
         GbvCanJWMP/+507TLIV2HEbBpa/Kj8UuNxSzJ5gQ8gtZYPq+4TAQdiRPj97230gX7UQ4
         3/2/F3RF9sfQqH3ppBY30SoF67rO7QMnwGs0dYX8/CAym0FrZEwsg2QyodSrl76NAT4R
         bTepRXxH9XowSJEi0w7mHPoJBSfu+uOyTDz7TGkmHxWKBGC5Cq7RsZ6dMS4sb/46uv99
         xsoA==
X-Gm-Message-State: APuU4Z8EH5M3cahLGYm94gVAbBM+9Bqt8K5ONE5waueieL4gUzvC6hq+
	scoRKWivZrMv9piIEXAdz8qivYZStm0U9ZIQaMJSypJutn1W20idy7letEo0YUGE3VscxGVGSws
	tachn86DpdVlytRpnxjnJ3f9w4JKLfFwmPoBsYocWwf6xVprKzeP6qfSpam0VAnmtOQ==
X-Gm-Gg: AZFdTZfeoXhGyKVdBtAf+Ays8q5tCYbjadbaDcnjjKEDhHlAUr+C906X+pdO906nYpd
	nTaTbTejCTJCuhWkzHhHLJuozw6ivhqw8pAQempi9t75LYjV80f6fgTvyezyllNvyRVH6gTLwsA
	KOllK+NUbAal4omQWlT6QzFibgqbZPRUkx5JEj6yaKpc1tDojU82gMEN342DCKlEcvctYVAk9Cl
	sM4AIOkAkTTihULfcSD4tMQAVOS3CY5W9ah5JHmaKUUtInljlg2V+rfym2QNMtnH1Ylq6LBfjF+
	OhtRVOa6qmOEYp98ilMEzFuxEgl3EeTUFMFydaxX4xMKyvxmIvzjB2mbcKt5F30QcFaV20uxGl3
	08O1lWT3Busecx5pqzfdk+OZKm0oGJoNrZtkmfDwaiZxQvyNuj4GuoUfdlVJv89L+oBBd08eTwL
	7+tqI/
X-Received: by 2002:a17:903:1b67:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2ee0dc3438dmr113739365ad.45.1794848761448;
        Mon, 16 Nov 2026 09:06:01 -0800 (PST)
X-Received: by 2002:a17:903:1b67:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2ee0dc3438dmr113739145ad.45.1794848761017;
        Mon, 16 Nov 2026 09:06:01 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:06:00 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:35:51 +0530
Subject: [PATCH v4 1/3] media: uapi: v4l2-controls: Add control base for
 Qualcomm iris driver
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
Message-Id: <20261116-b4-add_sc7280_mbr-v4-1-636fb6bc8772@oss.qualcomm.com>
References: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
In-Reply-To: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=1121;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=yr22iLCXb30gmSFU65q7mnwky8PcLxD0pxfBcfk6+ok=;
 b=0RA+EGMxxrRtfP0XfkDhndYlF50E4imUGjeljaP3xFReHx5+p58bSCqz6GM7+GfBTb1AFM9Me
 yJSftfmOYTeB5dqQxHFFJSk30GXsDp+M2HB9FbN63u3041A++ehZJZ3
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX86u3PFQTz52N
 s3KoNJAO1lAksjQV8lnH9MlpnVYJiPQ3Xk/58AOozLACdg0sG1fCxOvcJ6RQJbqmMoBPPDz5NE9
 8XIn3Z8pwSMuQRHYAP5gmnXnuLRAG9vIQCxNjPU09/Xz0A3uXRP8soDri7vNZq3bLPmn79y470u
 B0aC+FnspjiyvGtVfYPr1jomdy68Zp5XGt7hoFSwzxnuk6NpLtW+XKnQCaYc9vna8MvMBKVG0Sl
 ZUgnSKCW36229QI8B/M304qvN9ag6rC7JSnfjt77dWIH9gyesjwiMpAGiwX2UNcP02jW+j6dRxX
 ySXNTkTmpz2ikafHujiikvhmPUEx5ZfjuJdcpaf0bPJe8p5K1RauFw1F0S752hLfBvBUrfUmb3P
 UydgvlHiq8n5ax3MV2efYwYuJcuV2VwB3WLEwAtawP3KItsT+oHevsHFGLLpp5D3hsq6xc5KjHg
 AdPHpK9wpHX4ETiQSSQ==
X-Proofpoint-GUID: MQetw9mHBm297XUlqoG5lvHZMP3qKr0g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX2mEwPaj0Fu8N
 OG36g3xeX+TvYJ3V3jFmdw916SNfpS13Qch0PL7m5H/anwRMe0gDBOpZraEe5oAL2UajLmPsdFh
 iGLiNMmKwzro9sgsqtXBbNcOi2LUoC0=
X-Proofpoint-ORIG-GUID: MQetw9mHBm297XUlqoG5lvHZMP3qKr0g
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb37fa cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=inWu9NajWAUUfZ5We6AA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160068

Add a control base for Qualcomm iris driver-specific controls and
reserve 64 controls for it.

This range will be used for encoder features exposed by the iris
firmware that have no equivalent in the generic V4L2 control set,
starting with the MBR (Maximum Bit Rate) rate-control mode.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..ed2e2ef42829 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for the Qualcomm iris driver controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1

