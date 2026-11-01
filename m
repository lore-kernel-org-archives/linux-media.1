Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571951;
	b=kav+mRI7W9r6yeF8uT/SXbdMj83LRCdWO3B+NWo0r4aOrW9ql96c7WO92VziWTso+Bwa
	 RcvJUOefAbP5VQmkHfRpn6DsF5pTRkqcYPolYbIdtGG4XUQR25PoiAbEohZArS++HKKFl
	 mSJc1jyKifIIR0AyC1oYAYXmhqXjN2o0wROSHN3CzQmcBOFgqPaS7Ytq4KoiGfClI7Xnt
	 dO336vav1iyjbiNhLbhGL7K2akfmlIgNmfCa5fIc+35ECECQPK6BGnhWuWR7uDaJkab6A
	 kIroBVDwPptv7Qk+TXpSABCElhfjJpfNJ6gBjn8OgZEs5xz3qP5N1/nuCorygdoDHXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571951;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
	b=wrnWA3tORFA/pkqcMIT/ro2Oc+/ZVfJGQhabJnl0XeKjMKKcgHCjjc2lTClV/lfO0anc
	 j3svtebAItM5CBBVDtTDWWxwxaGbCX4aMCjQ9A2/z+/Ix6+ojV+jyRktAuaeEWkB2gg/D
	 sPODpdAd7i0VkD5Ln2Aq01BP/WQO7tZg2zXQOH68VBCHN3caLk8g5+SEKArnKzL3pa9+H
	 0w20LCohZN2ttXpBKOMCosWtcI+fzRM9CXC3ds0+m3cKeEvmbD/P2oPd+Vh5Xa1qP9W0h
	 YTQCdiUaf0GOTLyFnsLCyGA+JjeJBZ439C6MFIG4G7kcFcYzTj+lULSrGEkQJzUWOfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuQFYCfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjTemj+x;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E7B60701E7
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 22:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31E7B60701E7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nuQFYCfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjTemj+x
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KK1Ba834716
	for <linux-media@vger.kernel.org>; Sun, 1 Nov 2026 22:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=; b=nuQFYCfsssQ3y9N0
	7Za3EjBr7nYaRhEHo9aY3j7SnThyTGwMB/gPb5kJYP450DFQoxpU0e1nmLixVV2g
	Ryy94jRAyJPD183XJBUbly1erFQ8c8d+0JRI+ib3Y1GMov/cte8Tv9hCHE5XdPsO
	0jL2sdhUWBn6EGsz8oHxzjrMfRJq0zkKcqa9syoD2B3FRbMvY1BVgEmUFwIv9I50
	RoMr8LcuNQc4ncTb4h34iWJ6nuOXUq4XdRVDzWvKxRtXdkNl/oc3gkvB7xpbjcqO
	f5ZlITYalzKx+4c7MXLabR5NGdhYYH/qH6/7j6ht8uobG6vEnFPNFChWIteB4Abp
	E7xFZg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m9c4xc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 22:25:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3698bd5392cso2157661eec.1
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 14:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571948; x=1794176748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
        b=hjTemj+xHMwgMlPFEYhKPl2hIRd3KJPWzSakUXp2VISngyfpz7fRIMhNjc8BOG3ocY
         Q3N2pylPWvh1uvtq7R1TPCxIduGPSXknhEWlRzdjisd5a+3vd4lPPf8FBkrozsUscJx2
         dZfD1KaDHbyKukUZQG4abLk0rqWeFID8Ts4bFwwhosV+QhBUhlwmFi+Io+eovn6djCAK
         BXrplId+mku/tq8MNFWUy6kHswKb4tazPBY96NrIVywuWymTi0tXU8Df1ZJyaAgbtgUA
         F6/fHq/6cUnMFxcBKoyOngRdAZmBitTZ6JRsyMSLO+tt0SVamx6NVbBfgtcX/3yGDo1d
         D26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571948; x=1794176748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nwucajbD+HNWxH4FxeHiZU8tWXZnOU3zyZiJTCLv21w=;
        b=iClG+tmv1WX0tDnmolxGSjGNjsQMAa0vltgwlx0nntWUWWfXobsy/qouUWwsdlSEYo
         d14S/yGeRnSIrFKjZUoF5vaEq32xyXcZ7Ll7ld/O1hfqzRsfddhouKh5+c17HgPdOYRr
         dwhVy/9UFGl8oOsjcTGjGyv6W5FePXVdYdbFc1swAd3N0v1wSh1d5BkJIEk2h5ZMGnqe
         lHJADUYX0e5PvQUeJquAS9bmWOYGs5u5p/iErMHNN6qsAJ+AgKqvU6i7lWOlakZjnff0
         Ec+lk8dsTnNYiaEE/yHmnMjae0NJ5Il/JzE675599kqdw6P7TuOGeKvHSRwaM0p3wHKe
         RcFw==
X-Forwarded-Encrypted: i=1; AKwUvBxG25pjk8XW7733MBZuVHON9sw4GY1/qs26oUw+NLl8Fo8WIcfMtkTd58PLt50nr4eSc3U83qfPh/pa6g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJrETBgV1JmKHaaXIHYPeZ295Gp9n3DcZQNcb/ClHILZANALQSJ
	lNzBWD5tVV+xViULf1x/b3Du/W1m8qm3YJcrwzxmo6drTxLpehP82jXt11epDKMPTFi9TbOO9IP
	cQYAqsu/gEpSWzvUOwf9Rm6W3ciodO+IJ6IwAYuENc0OoOUZycEqWveVFpfIvgj9tKA==
X-Gm-Gg: AYBFou1OOpUHDhPCo7HdFlnHd3vjyaY02H0xQkFlzk6WyqhK2LbqI2EoUIsKrW7MGt9
	JqcmFUEuOwDuIp35rQlBahJhbx1RaTaPKjxqpfZVe+TdqsrNFFHdgu5uOkj+RqUWioVGZ41mfX1
	eICiFJ+eByKiTyIo7YYpw0ECJ1u2kaTGKxa6lJ8nQKYWLmz3JVlYabTAb8lyIJpFL4wl9frNEpF
	H7MlV6zTAcg550BTxf1KlRD+R4IlHlAatXg7uIBdLv6H9tvGnlJz9fzW9JWwtPp55F7Ml/J3RYt
	lj2KsdlOSi9iXXhHtCAqjWLNoRGXd0IlZxcOW5lujpQjYBCSjBSq2Dh2HuDeImLeH8kxmZ4p4gr
	WqYtFmzEe7X58R7yIOx/y1ma/c80GFTR5JYSDhfWyUsdXZa3kpPi9CDpY3aOgnGnEikeIL89AlD
	UjVVngzA==
X-Received: by 2002:a05:701b:2092:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1ac5b7e0185mr12212159c88.17.1793571948408;
        Sun, 01 Nov 2026 14:25:48 -0800 (PST)
X-Received: by 2002:a05:701b:2092:20b0:1a7:77ae:11f6 with SMTP id a92af1059eb24-1ac5b7e0185mr12212134c88.17.1793571947846;
        Sun, 01 Nov 2026 14:25:47 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:25:47 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:37 +0530
Subject: [PATCH v4 24/25] accel/qda: Add legacy shim support for DSP
 capability query
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
Message-Id: <20261102-v4-v4-24-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
In-Reply-To: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
To: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>, dmitry.baryshkov@oss.qualcomm.com,
        andersson@kernel.org, krzk@kernel.org, rob.clark@oss.qualcomm.com,
        jgg@ziepe.ca
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
        sandheep@qti.qualcomm.com, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        Ekansh Gupta <ekangupt@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=3736;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=jwnH5cfp8M6GHrX4Z/62vWuSavKSWMU+7o5H4b+rDhI=;
 b=e5bP4QRM4M++NoUYF49dvgjnn6jVgLjcjBzplELgWbocjqksZsYZ+UeV+0spKYA4N1U2Y6IMe
 CXSX78olZOjCfKLCICBHH6b1BTgTKI13Kv1urMO2RHlPcTyD5seSD2d
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-ORIG-GUID: l81WMo0ebN4I5E8MQfCE0Q2fsFFIOYD1
X-Proofpoint-GUID: l81WMo0ebN4I5E8MQfCE0Q2fsFFIOYD1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX2IZfdhai2yae
 VWdfBrm4jbEzyzB9tBW+l5S/8YZ/pGkinhVxT2kx9Rux3WvPFfnoMnbuS3j3GoqcAKUq0nX9ZAS
 OHjE9+JRJd5IglGPVP2dNzzNLmA1UQOub04zz2TMP6xMchAnZ9PAT8pr9SwgTE6pS/ZEufFss4y
 a0ecDK+Dn5iyldK7EP5m28nm/JjwK6pGrzB91IWIk91C65SUF6X/vvOpVMvNNWIG9SuNT1WFtl5
 2W1t0Cpcq0SlmSvgGuhr85bQ98BkQ1cQCX2o8gP4G6NzdU/Xus9zOcYM6l95eippt27n8LAbuMh
 7Df+suK7XTs1/6VPUTAjO69kgJGjmuq6Sm1tZ9V5/WX2SFoKk3hR/eLV7zrVO7gWLfTo6KAjSfF
 bUVKwNkup753qn0pdYHacdjhlSzO4U0nqd3RHaeGCkskXBn72CdGXbDzoD8eFUZLSaWEcsuztby
 BQKG/30AaccUUBbduiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX0SHYJXCgPyT+
 th8xicXxeWAeZibyMk0E64M4K0NaB01ksobGkEnS2b9kUu+RcCQiW1CpX0C3xDPqGGzZHMVMJsJ
 qy2+66j1ofmupQV6wImmLsRFlUXbkS8=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae7bc6d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=co94-PkH9mM8E1aZUYUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

Wire FASTRPC_IOCTL_GET_DSP_INFO into the legacy FastRPC compatibility
shim on top of qda_fastrpc_get_dsp_info(), so existing user space can
query DSP capabilities through the /dev/fastrpc-* interface exactly
as it could with the driver this one replaces.

The device-wide capability cache introduced for the native
DRM_IOCTL_QDA_QUERY path is reused as-is; the shim only has to
translate between the legacy fastrpc_ioctl_capability layout and the
shared qda_fastrpc_get_dsp_info() call.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_fastrpc_shim.c | 20 ++++++++++++++++++++
 drivers/accel/qda/qda_legacy_ops.c   |  6 ++++++
 drivers/accel/qda/qda_legacy_ops.h   |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/accel/qda/qda_fastrpc_shim.c b/drivers/accel/qda/qda_fastrpc_shim.c
index c1464b1adbc2..2be1dd116ef7 100644
--- a/drivers/accel/qda/qda_fastrpc_shim.c
+++ b/drivers/accel/qda/qda_fastrpc_shim.c
@@ -463,6 +463,24 @@ static long qda_shim_mem_unmap(struct qda_shim_file *sf, void __user *argp)
 	return 0;
 }
 
+static long qda_shim_get_dsp_info(struct qda_shim_file *sf, void __user *argp)
+{
+	struct fastrpc_ioctl_capability args;
+	int err;
+
+	if (copy_from_user(&args, argp, sizeof(args)))
+		return -EFAULT;
+
+	err = qda_legacy_ops_table.get_dsp_info(sf->session, args.attribute_id, &args.capability);
+	if (err)
+		return err;
+
+	if (copy_to_user(argp, &args, sizeof(args)))
+		return -EFAULT;
+
+	return 0;
+}
+
 static long qda_shim_invoke(struct qda_shim_file *sf, void __user *argp)
 {
 	struct qda_legacy_invoke_arg *largs;
@@ -550,6 +568,8 @@ static long qda_shim_dispatch(struct qda_shim_file *sf, unsigned int cmd, void _
 		return qda_shim_mem_unmap(sf, argp);
 	case FASTRPC_IOCTL_INVOKE:
 		return qda_shim_invoke(sf, argp);
+	case FASTRPC_IOCTL_GET_DSP_INFO:
+		return qda_shim_get_dsp_info(sf, argp);
 	default:
 		/*
 		 * Includes FASTRPC_IOCTL_FREE_DMA_BUFF, which the driver this
diff --git a/drivers/accel/qda/qda_legacy_ops.c b/drivers/accel/qda/qda_legacy_ops.c
index fc5e94c0c9bc..8d9d597c76c2 100644
--- a/drivers/accel/qda/qda_legacy_ops.c
+++ b/drivers/accel/qda/qda_legacy_ops.c
@@ -188,6 +188,11 @@ static int legacy_invoke(struct qda_session *session, u32 handle, u32 sc,
 	return qda_fastrpc_invoke_legacy(session->qda_dev, session, handle, sc, args);
 }
 
+static int legacy_get_dsp_info(struct qda_session *session, u32 attribute_id, u32 *capability)
+{
+	return qda_get_dsp_capability(session->qda_dev, session, attribute_id, capability);
+}
+
 const struct qda_legacy_ops qda_legacy_ops_table = {
 	.session_create = legacy_session_create,
 	.session_destroy = legacy_session_destroy,
@@ -201,5 +206,6 @@ const struct qda_legacy_ops qda_legacy_ops_table = {
 	.alloc_dmabuf = legacy_alloc_dmabuf,
 	.import_dmabuf = legacy_import_dmabuf,
 	.invoke = legacy_invoke,
+	.get_dsp_info = legacy_get_dsp_info,
 };
 EXPORT_SYMBOL_FOR_MODULES(qda_legacy_ops_table, "qda_fastrpc_shim");
diff --git a/drivers/accel/qda/qda_legacy_ops.h b/drivers/accel/qda/qda_legacy_ops.h
index 95a169edc594..c79003021fc1 100644
--- a/drivers/accel/qda/qda_legacy_ops.h
+++ b/drivers/accel/qda/qda_legacy_ops.h
@@ -57,6 +57,8 @@ struct qda_legacy_ops {
 	/** @invoke: Run a method on the DSP; takes ownership of each @args[i].obj */
 	int (*invoke)(struct qda_session *session, u32 handle, u32 sc,
 		      struct qda_legacy_invoke_arg *args);
+	/** @get_dsp_info: Query a DSP capability attribute */
+	int (*get_dsp_info)(struct qda_session *session, u32 attribute_id, u32 *capability);
 };
 
 extern const struct qda_legacy_ops qda_legacy_ops_table;

-- 
2.34.1

