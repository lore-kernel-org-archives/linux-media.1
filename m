Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108539;
	b=zaBFSCuSLSwl9kCAbbB3cTfzR3kAAfcIftEuBAB5fbHF0nWHd8ZzcJQEm8fBWTPi9s8D
	 QIHkw4w16LaVPgD94lwzXOs1mFM9lFpe6wd31IJQ4roSxRJn54dMUzxyhyoGjmmQiBMt1
	 RUZ7rI304r5i3ExUQElcXdrGdTwY1vnPYrROS6xz8gS4jxYvdnEo86YA4NSEnBjT24+lv
	 o8uxqZsHZ0qbt6pEmejkMTU7TWto/COHl6g15MJoR3ISpaVq2HXfqyVGEnf78zoGgtY+n
	 ho20F55md5WmiMCgqaMkJjGiLqDU4sGeVbUIW24jfjQUZVW1DSK0Ckj3gu3gN9iXSeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Wu6wfhQhW1dB1rR6rYt6nJW2S0rcMaPPfRauIfBGxdg=;
	b=CWwhGXZWMociq9uyeCDGCa3R0BrprvTo7H+68oTv8ANp1rzXjp4ap/EDEQVadG51Qvk1
	 /nTYL+Zxi4ZZGRiqNRAH2QYM9f7Y5K/kJW6r7RrufZBgfXLmMPfqSv5065NxaLRPRI6lz
	 2tsJhzDfFH2w1CgncPuaHGpUvpUEn7m743UZviRMzp2g9P9xMnFjM8qdEUezI3RU5J/jE
	 xQGr6S6wUBclQzpuovOiGbtNv7SJ9rqo4ZM6HCBFdt9gTDiIXoK1NLP04faQK7iszg2/V
	 QmbtRabin6LrKHTN+VHRqC/2kiMLW72VF2eKP40yBveYV6pPfH3VJPn5pYtNqmAObdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXOOeaKk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hd41mZi1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB002606A321
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB002606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nXOOeaKk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Hd41mZi1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeGBK1936213
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:42:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Wu6wfhQhW1dB1rR6rYt6nJ
	W2S0rcMaPPfRauIfBGxdg=; b=nXOOeaKk7UchDVGaTCxue398o4fNEl2F9RMKUe
	tBOhssxSTsYGSgty5eNrUv1WkgOgFS91zBrVTMQ+qz9v2hGr9SpvJSIyfFtHM61o
	EUc9+lve7LN75Ts4d2/joxo5EJimmu2vYXOQ25qjvGpf0zmnFDSLwjakS76IeEAh
	WzuxC7OXJIdEmCHdMderG62zXFkdCdET4bIxCjuqFHeRAB1rdMWL8yTH+QJvoXXp
	GZQp/fM2XRT/mt/kyn40iax9FOF7X43YYXvR8NPbOv9M7uCSqYw2dNW6KYo44MXI
	U5zvYk1HwITy0FdvG+fS36ZBz8yrVOsxfL4F94ZxUu0FWO2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavu49y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 13:42:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so887465485a.1
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 06:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793108537; x=1793713337; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Wu6wfhQhW1dB1rR6rYt6nJW2S0rcMaPPfRauIfBGxdg=;
        b=Hd41mZi1xixsDDDksMw1cqwW1yhVOtyc891Txct/pNvDEP0j2AroaxK+xWOKjj3br2
         F4I3R7EDBpq+Yq5j6YgZQCnw/1YqOluAISm+5HsxPOCkTCuOHgF1bLne8FY1X+uPxz2e
         sU2LhuuMObV55YHHjXlacRN2rhUumpz0KUU6qn3756sJJ2v3pFN8gA7DnreQZ9ksQRoJ
         2zXPDhrXL1y/jUMvXVN7qclqC6uk+XE1FbbySx9G0+EWrslfWLzlEkVv2X80ozu3oopA
         8Txk35l/R8GHzvzQdNCFPilhGs8sjg9hEDrcQbzdQ6j7+GH0MtDCD5dbXzN0Kg1ueA89
         3GrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793108537; x=1793713337;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wu6wfhQhW1dB1rR6rYt6nJW2S0rcMaPPfRauIfBGxdg=;
        b=v1JI0p4Uacsbs4rwHIuvtbFvAPqgFyuOQUMDoPgB2o69TyED7r0lBx9u46KViqXZ8B
         rsZrXMkFGWYYhBeOafipjptPdm/1vFPKF4UPppKxMZMfoZx1KCNxNlXzFY5Hk4ikZJcQ
         F6J9AskurSyEnPf4dSnTon2U3+AZzcNILAonS3C2eYmiKa7byNlBEKpV6Y8LGKOnJemo
         XHmbE1dGSQOoGXeSYhZv1WmiMRWdKFkhR0YIjqoVNmN/OmnSyswlKjMi8rE64lzGXSpy
         WbxVDKRPtLEnKl/ro4d0xejP1YLfA0974xr17sYK6ZRXwhvVh/xbISk6F284MvDYKjWT
         J+4w==
X-Forwarded-Encrypted: i=1; AKwUvBxRqxwFxehHx+NqSGY+D05w3FHeRWWPz0xDa9gyJU3EKrJvQPYsNF6xH2amG2jBaoi+fOZ3nnlSsiQa4g==@vger.kernel.org
X-Gm-Message-State: AFq9FYIOYYvhPPntlm3AL1Xu0ao0qJ+hx7aAy5ZUZQqcKZwYwjqlX8GC
	c6GJmaP2kK1nrD8xhcQNnkKmB4/cvX6TvMA7NxZBesJ7WNG6Nqwd11egEdm2yprPfhG7d3uEtPx
	kpbmKk68Wp/bbiyPU/VM5Q4HaT3vAeK/djl0JJWu1PG7H3jQbQQftx1B2ohG/4emm/g==
X-Gm-Gg: AYBFou2wyJzm0l7z7nx8DtHuNAQFkDoNA/gtVEtXabrY4hTC7x3XlE2rNf0D+hhX7Qk
	LGjeP5BhDITOf2SDBQ+WVrUGU/sJp/xs4DT/4yEPYNY9uex4QNEnpUP4QZujB/icGTUeQKWpjVD
	MjYYeCs6FB2YEEGx4jP0h+u/dV6/fbSaAxkXzhTcAgQEXCaapZOQA7p7ub0RIxPokBwyGID+0WR
	7dngyeLGSEim0cDup04TRm8ERjQlkryFOIWdqYUCmHceyG5oZU6RbvaSQ+4xSupMFSFyL8yZ3SJ
	bDFwKfiVwseLV0FOMpTrAyGScS5v5qOcT7fQIEjG3hUFctOk5zVuUlqiVMIhANz/Hh7YRgqy5Ai
	jFjOisqPzksPMCJ5ca99g64gSN0BgMOIZ9+9G8RV/b/9Iy2FdJDS2jmZtxmVQj/rVHsFwmnfbQl
	P4PyypYUgSdOcG9+qZjBXlE8qDzYGzCqcI9tbk9sRJtX25a4l6OyoY6lcv6WH4qiIQlyebXhqMT
	WdzvhRc
X-Received: by 2002:a05:620a:1a24:b0:93e:6c02:d181 with SMTP id af79cd13be357-940ef914ad7mr1601497885a.14.1793108536674;
        Tue, 27 Oct 2026 06:42:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1a24:b0:93e:6c02:d181 with SMTP id af79cd13be357-940ef914ad7mr1601493385a.14.1793108535897;
        Tue, 27 Oct 2026 06:42:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm23218174f8f.16.2026.10.27.06.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:42:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:42:13 +0100
Subject: [PATCH] misc: fastrpc: fix use-after-free of fastrpc_user in
 dma_buf release
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
Message-Id: <20261027-fastrpc-fix-v1-1-4610a10a2901@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADSq4GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAyNz3bTE4pKigmTdtMwKXaMkyyQDE6OUNFOjJCWgjoKiVKAw2LTo2Np
 aANgI2G9dAAAA
X-Change-ID: 20261027-fastrpc-fix-2b9b042df52b
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Vamsi Krishna Gattupalli <quic_vgattupa@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pQJ5w4uFzmpiyT50moDuBTo9M-S1gv1v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfX/mlAF/F8SQOr
 XGuImxrBsbqI0z7dVGD6/u2fEUQ0CKy0HUPWwXOVDCXtpWnSn7wuXvkqUm65Lv2G78al7thggTH
 gsZ2NhhgbAVDBpVp706vjkI2Kkotcng=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae0aa39 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=qbNRoFHTQ0jijyljazYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: pQJ5w4uFzmpiyT50moDuBTo9M-S1gv1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NCBTYWx0ZWRfXwfVtjAzKMLOP
 xebDhqb73z906rh/uAak4hqc3h0dQAO5zZo/ixovrQ5YjgfoDGPD39hlhLdVQSM8xfd9fvYnPzF
 Gh1FM/zlvzrgJ0Qw2+TE+bvfl5PJUvkwo/jEqh60egRq033IOhHh2J5akd+K0kik++UAUxR7Nt5
 R/Iwjyr+BEYTejBMCg+fNCcrPvABDzB4zj7mM3O0uHeFxP+KYIz+kQOXzFeIHyeFnPnvaZLsqea
 9lVd+MP19yRHzKiJsnVit9irG8Qqyahl5xehazHzcso8Ipp22GfbVqK1sOhIvzidsd1LVYHCqhH
 eTCRAZN4NYt/qhpmtBTU1wlOkrwf7+lVwJKnn+flNCErs4Qtl1ivYqYuY8kOT4XVndpDqVpRWpE
 PraqnCb3A+th0UN5bRjyMKCdqRHQntcgNqQDvgMNB0/0SKR39BIZ+vVYQcIDt4P+DC/p4J0K0Pz
 KZdqm2NmFN70aV9BI0Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270054

When a process closes its fastrpc device file descriptor, the release
function drops the fl refcount via fastrpc_user_put(). If that was the
last reference, fastrpc_user_free() runs immediately and frees fl.

However, any dma_buf exported via fastrpc_dmabuf_alloc() stores a raw
buf->fl pointer without holding a reference on fl. If the dma_buf
outlives the device fd (e.g. passed to another process, or simply
released later via delayed_fput), the dma_buf .release callback fires
after fl is already freed.

Then accessing the now invalid buf->fl triggers a kernel oops:

Unable to handle kernel paging request at virtual address 000103f6a9025bf5
  Mem abort info:
    ESR = 0x0000000096000004
    EC = 0x25: DABT (current EL), IL = 32 bits
    FSC = 0x04: level 0 translation fault
  [000103f6a9025bf5] address between user and kernel address ranges
  Internal error: Oops: 0000000096000004 [#1] SMP
  CPU: 0 PID: 74 Comm: kworker/0:3
  Workqueue: events delayed_fput
  pc : fastrpc_buf_free+0x34/0x6c [fastrpc]
  lr : fastrpc_release+0x14/0x20 [fastrpc]
  x1 : aa0103f6a9025bf5  <- corrupted buf->fl pointer

Fix this by taking a reference to the fastrpc user via fastrpc_user_get(fl)
before calling dma_buf_export(), and releasing it with fastrpc_user_put(fl)
in fastrpc_release() once the dma_buf is freed. This mirrors the reference
management already used by fastrpc_context_alloc/fastrpc_context_free.

Fixes: 35a82b87135d ("misc: fastrpc: Add dma handle implementation")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index af18ff1992eedb6f44ff57ded4f0c577e040e885..36722ed66edff307d166bda30db1d4fe9f73da0f 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -796,8 +796,10 @@ static void fastrpc_unmap_dma_buf(struct dma_buf_attachment *attach,
 static void fastrpc_release(struct dma_buf *dmabuf)
 {
 	struct fastrpc_buf *buffer = dmabuf->priv;
+	struct fastrpc_user *fl = buffer->fl;
 
 	fastrpc_buf_free(buffer);
+	fastrpc_user_put(fl);
 }
 
 static int fastrpc_dma_buf_attach(struct dma_buf *dmabuf,
@@ -1802,10 +1804,12 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
 	exp_info.size = bp.size;
 	exp_info.flags = O_RDWR;
 	exp_info.priv = buf;
+	fastrpc_user_get(fl);
 	buf->dmabuf = dma_buf_export(&exp_info);
 	if (IS_ERR(buf->dmabuf)) {
 		err = PTR_ERR(buf->dmabuf);
 		fastrpc_buf_free(buf);
+		fastrpc_user_put(fl);
 		return err;
 	}
 

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261027-fastrpc-fix-2b9b042df52b

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

