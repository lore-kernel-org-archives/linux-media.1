Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571886;
	b=NUcyuTVz8uExT2QSg7u3nDjQoSjuZOVRSzbqSE8apny5kOgj/ls8u8BGdo8IZdmMhEBV
	 R0RH8s66bjL+O3qsqqtkH2YCzN3TwDtaPef7rGyolEQ8NnhZdMJJz4paXdWCUEZieNp9c
	 rv84pHuw23CY71DwLgoP8zD2tPY3bFK730xY4YrUfFvY6Gfh/adawE75zr4aQkcZlqGaq
	 JxzpVDcKBvyZMtuPUComCyh9+WEUKV+qN+VFaTooVt5Sq0Xu0rvhuFQ2CYgADsIYvXTT4
	 6cZxc5cKfmbZA/EyI87rBkyMMJrCRuXdTXx4xsBfvpFR3IcPMp25xd+VopbDBpVrFvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=;
	b=117rbc9R7QepSUMSPqlPyJlwJSLS+tplXkcpXJ+hZcsvdxZ4kWJqs9qR0MspnpDjo5+C
	 KoJktBsR4BfmSjHqXE5uj1v1WBWafTXrKU2YDpOpiuvIlmk3o8fuG6wa+oNkuOuEYKG3I
	 CzLHsPLq9f1sPFVb6w8xNUFAwfD52iNbdacx2lQZyaslpK/NPztZvgkkQZfAUkA8/JMpa
	 aoVO3MqRNIlTt1hSN3U2ofWq58fh0gs+um3hhY9GQB+LPJxt+kJie5YoshhGeA+XRIIJ+
	 46cooz2qCGKeDPAOAwXR7VYkm+BvB8FVJPL7yzdZxArz/Z5nYhBwCWLPajgGqmte6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOKqP4WH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMwfAmHv;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B7B606A6F3
	for <linux-media@vger.kernel.org>; Sun,  1 Nov 2026 22:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32B7B606A6F3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MOKqP4WH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YMwfAmHv
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1KJpMl2776904
	for <linux-media@vger.kernel.org>; Sun, 1 Nov 2026 22:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=; b=MOKqP4WHpUGsG97S
	+RbcfirgnZmqNu6ylxITEuLkP4hUkO2vRmBui5AparsJn4CbJIpwtM6O74ndlbLR
	hF6oFYDVFXkkzGcwuE49aqocjthBakWKBtqAyV7Y5MM642Lj7956KaJKNoaCsJaP
	pFqFo5Q8S7Z9MtLeG9Fvp4RjeOi4Z9XBas2et1/HEdrnI/zu/+hvs1zQ65pqiLka
	OGYq5XNgC7YC8fzvRHvbzWhiC1SANrkiH1Z2TCRfgjtg9j94Gs/uV72DFTTZmMdE
	nZvH3R4xOdbM+vJw52gTWGA9de7bjNl6IbZSlrWvJnrgpvQ0QTZ+gwq6b9gLmA7I
	4TIgYw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn61fvmhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 22:24:44 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a2af4c8cbaso694190c88.0
        for <linux-media@vger.kernel.org>; Sun, 01 Nov 2026 14:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793571884; x=1794176684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=;
        b=YMwfAmHvPNyw4VxT/aqyojls14PsQQBS4ZH97i8bmWrcEPuZApoLHDgCGUZe/sK7U9
         jMziRPo7exP3cmTixvKHgNzrtaMJ42asFqbRfXgzSbZntOwDzhsc7svfjAMygwJJ/Epp
         8BxwPwvjYOVli0GgLHK6/69GsQMKXTyXiV6dhiDlPass9v10fo63RQ8PXbfYVgqeqUC0
         EaBJD5aXzIMNrITm0ge/wO5Hv4DyVlNMbTdp8X30LDSpsqE82+PI2870Mn0xme2bXWrn
         Pj2iQuXuWocE0XNCLxvY71iAFu2KbPGBCwuh56smefC5mpqhi0QgQqALAWvTV9JhbfRq
         zePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793571884; x=1794176684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ETCpV5BhRzI4wWLccSeMDl+J3Iw6ow8Qk9nYMHVwpS8=;
        b=mh2eUtFSFB9938ZHT6Hvtuis7b+4Z787uUa9Tg0fUVwtyGqJjROcRBVVWlHD3hBlsC
         PjbRquSvBH3URYZFfqLG2z1DvOotZfl7ieaJgQtpmgdl6ruZ1R8GMRrjjvvqmGfrqgS5
         5YOGFuHKOv4Xrmm/tyWB/ihR0VgxJqskl4JVgsNKXmC3iup/X34TG8BU5ThOZYpoveFd
         kFJRxpBJG8b7Tn24bQshDMhiQ0C8WV6Ei9rYH4F2PJ48Z/hBNbedgjuyCnYrNZSsRH2e
         ByutCVfVLHjqtg80K6Gk45aItlBl+xBtMGOTFkJ/a1jqi/3P+kUxoNyrvYDVVeS4Zcge
         qZ7A==
X-Forwarded-Encrypted: i=1; AKwUvBxk4Qsg2brQD7NBD//42/eRZPf4obGIdnIFwYd1/bC8UG6kl/jpA2jWkTRVT52NDXbVnBAGkSWgAy65aA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLYyNnRSQ5Ht7DxMAOJ4RKQRtkUFfOgMAQhVroxtysg11tyCN9q
	Ipqwwt09D5y/SsdQrEjfKhJRjUt0itwjdZSYwS5JSxvmbUqvMBUzGJSRUC2gcLe5gRYDx1U/+Vx
	4MXCHF4hGgS/mjX+ZHrxwwNF1dugU0O8zUO/rVlZyt9sg3oMVt80BBiYK6CcVEQbovw==
X-Gm-Gg: AYBFou2ewDFXwgObWmsd5uudcAHpobYjtVVxnei4nzgOjhbj72x8OkKq/2Q7eIvEl7p
	AuwIUUOwJANotAzhGGP1pzz8f83pQB4AcMGnZaMFrdzoHCK4fiKATHoiUiGOBnK9tgPEP4rr9Np
	UYChN0xSyj76yIIXVlFn6cyyn4AEzR40grp5JlGsPn2Yekqo2plGf0rVQsGdq8R+bFfDyw9OVUJ
	q7Yom+YCzwz7lr2z6th3Qn/oerjK/LvMZEQ8eIRQiRVyIAbyCjejUxyRW4SODYlb90vjgnWKNlI
	TCB+sExXDzh5A5YRF6lfdCgGEH4Um6veXYqs/OjDXdl9kQPUULUq9FBFO4H8eAjvOIYzR/0rb/z
	J0me5c91nnCPRGI1mwZrd28u+DywPKiEelS04/ujp4opIfGOkWgpl4lwCS2wZQuWQpEOs/ZzijD
	onTjFsRA==
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr13181336c88.0.1793571883965;
        Sun, 01 Nov 2026 14:24:43 -0800 (PST)
X-Received: by 2002:a05:701b:4186:10b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1ac4f91ee96mr13181297c88.0.1793571883282;
        Sun, 01 Nov 2026 14:24:43 -0800 (PST)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1932sm27742653c88.2.2026.11.01.14.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 14:24:42 -0800 (PST)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 03:51:31 +0530
Subject: [PATCH v4 18/25] accel/qda: Add remote memory unmapping from the
 DSP address space
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
Message-Id: <20261102-v4-v4-18-88f2f24a5f0b@qti.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793571679; l=10517;
 i=ekangupt@qti.qualcomm.com; s=20260223; h=from:subject:message-id;
 bh=AWZQyFdzsOaF7etSPJghL5yJhJX0fEhF3SEzW9eDeRE=;
 b=wbP31vIPeLB5NewaMIgH4YiMQTC6PbubFXGit5A8McQrOa8OQITyBtgRNTs7S3TnueUrF/x0m
 3zGOcfNvkXQADGbYKzdxoc8uyyOIYjXWHSlotSqMdTQamPkhRyb6CyD
X-Developer-Key: i=ekangupt@qti.qualcomm.com; a=ed25519;
 pk=n0SepARizye+pYjhjg1RA5J+Nq4+IJbyRcBybU+/ERQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX3oM/6NksvygH
 flOlsvtHMKbHJUOCgg2tpYlhXi9bfSXOtO2fH6hrg8geuoAreYnWp0Os2rXuXqo3WfAiU7N58A0
 rG9exIJWVb7gxZ8tW5yzEqjP2DAcsgw=
X-Authority-Analysis: v=2.4 cv=V/LoQuni c=1 sm=1 tr=0 ts=6ae7bc2c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Up_xq6likoeVUbWbdXMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 0wew1Ff__dmd8vuKtO-rzdVF-8eAXbKX
X-Proofpoint-ORIG-GUID: 0wew1Ff__dmd8vuKtO-rzdVF-8eAXbKX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA4OSBTYWx0ZWRfX5EMIjeKJkLwz
 ThoNf8jq2T3ekx5JGFjg/vKBdwioB/fdgrsAGRQ8eW29FbT7Jddnd8vV8bkqzkHitdS9SafpZOV
 YXDJUBu+XfZPTJt6jcv3Rhk3ypoW3Sy6tR9lxmIrFwz0kntX7ujHLo0YJ58uaaKdBCV/FfY9vpj
 GqlvIUyH6/0gSEK3tLSCtRbumipyweM2NsJOBXchfpbKhKARtzo4A4yJPUsTtiJe+dUORai9jdU
 fk3Vi9JYoKdQkS4x84/y11ulD9ub7VcqO/7IrtgM9beVXb6wzUAm4IE0WR+wr7AIm12caI7Q0C6
 pETXLYeKP9vLsyhQ6gl5l3TGCu0xC2/MPpQmhBJzdbLmqwZ8m2ukrYjjO32VjZD505a2wZdFykO
 spycQjYj43eBXwV7+btP+teB5/faadHCD52uEzk101WQsXE260hE4rh8nahhG4QFLkX0q1dFkPz
 uaSAf0beEePKglLOsIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010089

From: Ekansh Gupta <ekangupt@qti.qualcomm.com>

A buffer mapped for the DSP stays mapped until it is explicitly
unmapped, so user space needs a way to take a mapping down once it is
no longer needed.

Add an ioctl that removes a mapping, naming it by the address that map
returned. As with map there are two flavours, selected by the request:
one matching the plain mapping and one matching the attribute-based
mapping, which also carries the DSP-side buffer identifier.

The buffer itself is kept alive by the handle it was created or
imported under, so unmapping does not touch it; the mapping and the
buffer have independent lifetimes and user space is expected to keep
the handle open for as long as the DSP uses the mapping.

Signed-off-by: Ekansh Gupta <ekangupt@qti.qualcomm.com>
---
 drivers/accel/qda/qda_drv.c     |  1 +
 drivers/accel/qda/qda_fastrpc.c | 73 +++++++++++++++++++++++++++++++++++++++++
 drivers/accel/qda/qda_fastrpc.h | 32 ++++++++++++++++++
 drivers/accel/qda/qda_ioctl.c   | 24 ++++++++++++++
 drivers/accel/qda/qda_ioctl.h   |  1 +
 include/uapi/drm/qda_accel.h    | 30 +++++++++++++++++
 6 files changed, 161 insertions(+)

diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
index 7f19380701d9..c5b41b869692 100644
--- a/drivers/accel/qda/qda_drv.c
+++ b/drivers/accel/qda/qda_drv.c
@@ -126,6 +126,7 @@ static const struct drm_ioctl_desc qda_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_INVOKE, qda_ioctl_invoke, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_SESSION_CREATE, qda_ioctl_init_create, 0),
 	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MMAP, qda_ioctl_mmap, 0),
+	DRM_IOCTL_DEF_DRV(QDA_REMOTE_MUNMAP, qda_ioctl_munmap, 0),
 };
 
 static const struct drm_driver qda_drm_driver = {
diff --git a/drivers/accel/qda/qda_fastrpc.c b/drivers/accel/qda/qda_fastrpc.c
index 744d7317cbe1..dbd14cd07cb2 100644
--- a/drivers/accel/qda/qda_fastrpc.c
+++ b/drivers/accel/qda/qda_fastrpc.c
@@ -1072,6 +1072,73 @@ static int qda_fastrpc_prepare_args_mem_map(struct qda_fastrpc_invoke_ctx *ctx,
 	return err;
 }
 
+/*
+ * INIT_MUNMAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_munmap_req_msg)	IN
+ */
+static int qda_fastrpc_prepare_args_munmap(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_unmap *uargs = argp;
+	struct qda_fastrpc_munmap_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	int err;
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MUNMAP, 1, 0);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 1);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, sizeof(*req));
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+
+	req = kernel_gem->virt;
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->vaddr = uargs->vaddrout;
+	req->size = uargs->size;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, req, sizeof(*req));
+	drm_gem_object_put(&kernel_gem->base);
+
+	return 0;
+}
+
+/*
+ * INIT_MEM_UNMAP packed layout:
+ *   [0] req	sizeof(qda_fastrpc_mem_unmap_req_msg)	IN
+ */
+static int qda_fastrpc_prepare_args_mem_unmap(struct qda_fastrpc_invoke_ctx *ctx, void *argp)
+{
+	struct drm_qda_mem_unmap *uargs = argp;
+	struct qda_fastrpc_mem_unmap_req_msg *req;
+	struct qda_gem_obj *kernel_gem;
+	int err;
+
+	ctx->sc = QDA_FASTRPC_SCALARS(QDA_FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
+	ctx->handle = QDA_FASTRPC_INIT_HANDLE;
+
+	err = alloc_kernel_args(ctx, 1);
+	if (err)
+		return err;
+
+	kernel_gem = alloc_kernel_gem(ctx, sizeof(*req));
+	if (IS_ERR(kernel_gem))
+		return PTR_ERR(kernel_gem);
+
+	req = kernel_gem->virt;
+	req->remote_session_id = ctx->session->remote_session_id;
+	req->handle = uargs->dsp_handle;
+	req->vaddrin = uargs->vaddr;
+	req->len = uargs->size;
+
+	assign_kernel_gem_arg(ctx, 0, kernel_gem, req, sizeof(*req));
+	drm_gem_object_put(&kernel_gem->base);
+
+	return 0;
+}
+
 /*
  * INVOKE_DYNAMIC: the argument descriptors are supplied by user space, which
  * is also responsible for having imported every buffer to a GEM handle.
@@ -1141,6 +1208,12 @@ int qda_fastrpc_prepare_args(struct qda_fastrpc_invoke_ctx *ctx,
 	case QDA_FASTRPC_RMID_INIT_MEM_MAP:
 		err = qda_fastrpc_prepare_args_mem_map(ctx, argp);
 		break;
+	case QDA_FASTRPC_RMID_INIT_MUNMAP:
+		err = qda_fastrpc_prepare_args_munmap(ctx, argp);
+		break;
+	case QDA_FASTRPC_RMID_INIT_MEM_UNMAP:
+		err = qda_fastrpc_prepare_args_mem_unmap(ctx, argp);
+		break;
 	case QDA_FASTRPC_RMID_INVOKE_DYNAMIC:
 		err = qda_fastrpc_prepare_args_invoke(ctx, argp);
 		break;
diff --git a/drivers/accel/qda/qda_fastrpc.h b/drivers/accel/qda/qda_fastrpc.h
index 1bd696baa95c..889b41dc20b0 100644
--- a/drivers/accel/qda/qda_fastrpc.h
+++ b/drivers/accel/qda/qda_fastrpc.h
@@ -46,9 +46,11 @@ struct qda_session;
 /* Methods of the initialisation handle */
 #define QDA_FASTRPC_RMID_INIT_RELEASE		1
 #define QDA_FASTRPC_RMID_INIT_MMAP		4
+#define QDA_FASTRPC_RMID_INIT_MUNMAP		5
 #define QDA_FASTRPC_RMID_INIT_CREATE		6
 #define QDA_FASTRPC_RMID_INIT_CREATE_ATTR	7
 #define QDA_FASTRPC_RMID_INIT_MEM_MAP		10
+#define QDA_FASTRPC_RMID_INIT_MEM_UNMAP		11
 #define QDA_FASTRPC_RMID_INVOKE_DYNAMIC		0xFFFFFFFFU
 
 /* Handle the initialisation methods are addressed to */
@@ -197,6 +199,36 @@ struct qda_fastrpc_map_rsp_msg {
 	u64 vaddrout;
 };
 
+/**
+ * struct qda_fastrpc_munmap_req_msg - Request to remove a plain mapping
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_munmap_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @vaddr: Address the mapping was made at */
+	u64 vaddr;
+	/** @size: Length of the mapping in bytes */
+	u64 size;
+};
+
+/**
+ * struct qda_fastrpc_mem_unmap_req_msg - Request to remove an attribute-based mapping
+ *
+ * Layout the DSP expects; do not reorder.
+ */
+struct qda_fastrpc_mem_unmap_req_msg {
+	/** @remote_session_id: Session the mapping belongs to */
+	s32 remote_session_id;
+	/** @handle: Identifier the DSP tracks the buffer by */
+	s32 handle;
+	/** @vaddrin: Address the mapping was made at */
+	u64 vaddrin;
+	/** @len: Length of the mapping in bytes */
+	u64 len;
+};
+
 /**
  * struct qda_fastrpc_msg - FastRPC wire message for remote invocations
  *
diff --git a/drivers/accel/qda/qda_ioctl.c b/drivers/accel/qda/qda_ioctl.c
index cd3cea72f50e..17d1b488b4a9 100644
--- a/drivers/accel/qda/qda_ioctl.c
+++ b/drivers/accel/qda/qda_ioctl.c
@@ -197,6 +197,30 @@ int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_pri
 	}
 }
 
+/**
+ * qda_ioctl_munmap() - Remove a buffer's mapping from the DSP's address space
+ * @dev: DRM device structure
+ * @data: User-space data (struct drm_qda_mem_unmap)
+ * @file_priv: DRM file private data
+ *
+ * Return: 0 on success, negative error code on failure
+ */
+int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv)
+{
+	struct drm_qda_mem_unmap *unmap_req = data;
+
+	switch (unmap_req->request) {
+	case QDA_REQUEST_MUNMAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MUNMAP, data,
+					  file_priv->driver_priv);
+	case QDA_REQUEST_MEM_UNMAP:
+		return qda_fastrpc_invoke(QDA_FASTRPC_RMID_INIT_MEM_UNMAP, data,
+					  file_priv->driver_priv);
+	default:
+		return -EINVAL;
+	}
+}
+
 /**
  * qda_ioctl_invoke() - Run a method on the DSP
  * @dev: DRM device structure
diff --git a/drivers/accel/qda/qda_ioctl.h b/drivers/accel/qda/qda_ioctl.h
index afb3ed0e132e..9c053349c3fa 100644
--- a/drivers/accel/qda/qda_ioctl.h
+++ b/drivers/accel/qda/qda_ioctl.h
@@ -16,6 +16,7 @@ int qda_ioctl_gem_mmap_offset(struct drm_device *dev, void *data, struct drm_fil
 int qda_ioctl_invoke(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_init_create(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_ioctl_mmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
+int qda_ioctl_munmap(struct drm_device *dev, void *data, struct drm_file *file_priv);
 int qda_session_init_create(struct qda_session *session, struct qda_init_create_args *create);
 
 #endif /* __QDA_IOCTL_H__ */
diff --git a/include/uapi/drm/qda_accel.h b/include/uapi/drm/qda_accel.h
index bd2d0f4308b1..43598ddef461 100644
--- a/include/uapi/drm/qda_accel.h
+++ b/include/uapi/drm/qda_accel.h
@@ -18,6 +18,7 @@ extern "C" {
 #define DRM_QDA_REMOTE_INVOKE		0x03
 #define DRM_QDA_REMOTE_SESSION_CREATE	0x04
 #define DRM_QDA_REMOTE_MMAP		0x05
+#define DRM_QDA_REMOTE_MUNMAP		0x06
 
 #define DRM_IOCTL_QDA_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_QUERY, \
 					 struct drm_qda_query)
@@ -32,11 +33,17 @@ extern "C" {
 		 struct drm_qda_init_create)
 #define DRM_IOCTL_QDA_REMOTE_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MMAP, \
 					 struct drm_qda_mem_map)
+#define DRM_IOCTL_QDA_REMOTE_MUNMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_QDA_REMOTE_MUNMAP, \
+					 struct drm_qda_mem_unmap)
 
 /* Request types for drm_qda_mem_map.request */
 #define QDA_REQUEST_MMAP	1	/* Map a whole buffer */
 #define QDA_REQUEST_MEM_MAP	2	/* Map a region of a buffer, with attributes */
 
+/* Request types for drm_qda_mem_unmap.request */
+#define QDA_REQUEST_MUNMAP	1
+#define QDA_REQUEST_MEM_UNMAP	2
+
 /* Query type definitions for drm_qda_query */
 #define QDA_QUERY_DSP_NAME		1
 
@@ -173,6 +180,29 @@ struct drm_qda_mem_map {
 	__u64 vaddrout;
 };
 
+/**
+ * struct drm_qda_mem_unmap - Parameters for removing a DSP mapping
+ * @request: QDA_REQUEST_MUNMAP or QDA_REQUEST_MEM_UNMAP
+ * @dsp_handle: Identifier the DSP tracks the buffer by (QDA_REQUEST_MEM_UNMAP)
+ * @vaddr: Address the mapping was made at (QDA_REQUEST_MEM_UNMAP)
+ * @vaddrout: Address the mapping was made at (QDA_REQUEST_MUNMAP)
+ * @size: Length of the mapping in bytes
+ *
+ * Removes a mapping made with DRM_IOCTL_QDA_REMOTE_MMAP, named by the address
+ * that call returned in drm_qda_mem_map.vaddrout. The request must match the
+ * one the mapping was made with: QDA_REQUEST_MUNMAP uses @vaddrout and @size,
+ * QDA_REQUEST_MEM_UNMAP uses @dsp_handle, @vaddr and @size. The buffer is not
+ * affected, so its handle must stay open for as long as the DSP uses the
+ * mapping.
+ */
+struct drm_qda_mem_unmap {
+	__u32 request;
+	__s32 dsp_handle;
+	__u64 vaddr;
+	__u64 vaddrout;
+	__u64 size;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.34.1

