Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779707;
	b=1MV5GNg3Y2G13YSr9wpixLhllnbOjKZy1kwSJGX+nIL3LuedODJdH+wwpHaEFCag1yrS
	 +eFFJRe4e/xKWrf83dMH79ut7c/ScKkvKSLml1GTN03m+G50p4qcyarO6UScjwXJJlo92
	 RKWcA4djwafDE1zfdcvNhUJFb+nwzFY4+tPdYzdmPijiXFqPxKEx/CoSgFnge11samLrd
	 1ajxi8H55R4oCn9Tp1e9JX/IqCWJjjMDFZwNVy6NOC2itgU9bOarp7v5EtCq6XxqLk0sH
	 nLAdQScTBrF7sjOgCrq3a93aPNWwrXRvDmkELMEoAPQVOIPU5h1/9f6drQu9Fyubj1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779707;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=LNbwnZgnZRBmXitaSP9m8ecdg1y9pIvlUsa0s/9VW+Q=;
	b=ATjGWs9qphVmM2McmHVlBgS+LHb4vXLSJtPZSgPqhLq5jzbzurSAb4/7xl3fOCC/cPsn
	 CqJH/3dtC8KKpUkMt8KCUurrl4c3HPnmqfdtj6zjzl14WwsLcRJJD0VK9Joc5js5M9xml
	 LmhCzsaErUDK9+QHbMwhsQzmpHMkI9QBCiX+uEVKAIbvsh4jFarbPhDo/ogQawRri5Yv4
	 nrwI1Mmf03RsCosqS+Y81J6Z/mxVPbngol50NwBRKKdUhHLHEuBg+T8yJL1/N8qXTEiO2
	 5t+jsiRlUOIeDvQzIvKnYyQQCwtED/dxrLbOiKtHgoU9J4YKRPZjek0VZyNSBpByvag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.204.34.130
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83845606A6A0;
	Fri, 27 Nov 2026 11:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83845606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1795779680t75fa3012
X-QQ-Originating-IP: ZcPxIE3Wl0Qn6RcePu7TZOYMvdvF01Bi8cIRbUzI6Ss=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 27 Nov 2026 19:41:18 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16196504210606186933
EX-QQ-RecipientCnt: 19
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 27 Nov 2026 19:40:57 +0800
Subject: [PATCH v2 4/5] media: iris: Preserve timestamps on error buffers
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
Message-Id: <20261127-iris-va-fixes-v2-4-385e8636c22d@radxa.com>
References: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
In-Reply-To: <20261127-iris-va-fixes-v2-0-385e8636c22d@radxa.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 dragon@radxa.com, Chris Obbard <chris.obbard@oss.qualcomm.com>, 
 Deepak Sikri <sikrid@qti.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Loic Minier <loic.minier@oss.qualcomm.com>, 
 Jason Pettit <jason.pettit@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>, 
 sakimidare <ssmzhn@163.com>, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=sophon@radxa.com;
 h=from:subject:message-id; bh=n1ViCHdS71QA0f+YOFo2yT79o1EmcPLDGtJvQTmraqk=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDNmcOYF3Vb+9/6m07OEhtfZbwWzv9Tcyvcrriu6qTPz2e
 WJIJGtlRykLgxgXg6yYIotCPMNc9srca0/FSvVg5rAygQxh4OIUgInkvWT4X9rNtcbB0Ol0hnKS
 YRbTKc5r7F0V6z7k/7Bade9wzpMTaxgZ5p3fZ7YnZGV45UyHsPjzv84d0xG7JHFcKTg3qFaFz5e
 NFwA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: NFN0Qhrj1+QE+jxzpwMXd7ggPKpBJlUqlSG1zQVQzb8b0b+5pIvLSLfj
	q1M6sQ4wtMuNow/zsUgIGdtVZi3lZh56yuViAyXix+6/ahFPiv+TuuSnReK3EBHnUYgfDky
	owLlLiZt0oP/7jQa9UuM71BQ5m7KNX1Z1aHbj+GDrsbcozxa0/AWQTOXpPCohRhBAT6sRL9
	1yaHbguUqjDQOFR7OCWp93YZfrL31LBxQY2k3G86JrO4uteVbZZu+cCP7LC1JNQiQeo0mqi
	x0xKa8co3Za2eSWQc44ycnoOFqrsxH5dZO83zrsD26pYaHH5XcOBa2y7cSSjeU7xgIhBDYa
	yRo+qV/T40/wkw5AV84Ja+d+6xQPua7mJM11poMkF4oDLUJAnUN7cpbEe4c1Rj2Tm4NXh3C
	AQ15SF5B4qisT+4Onuo3n3dFMoMi9zv7dwP+2MK4wG06Kq622kVNx/JxQXPZl34uaZHc/RQ
	0aQabuMHw6xdeKPVKSKu2NbwyzQW3T4gdcRiPj9/XPcQcz4xC9ZVK77LkuZtDi8374vAKlt
	9LyM1TlAFRZA8+kxzQy1CuDir6jGfpP/Zb9J4L3fCUvgCg0clzmgbTjWAI8a8v5mrjGb8XA
	oh+XT7ihCuB4hjtvqPcupTcNWnsmIGFe7B+noCByfrrMKo2gMsL7bV7lAYFurYlVKaTcSz3
	MO3cOOkewWIHSNGUyCInEM6HqLbB5MV79nhborHq9jiMQJSXzetL9zE31Wjxmzdvh4mmThx
	GYuN0LAZaKKwmO3xNr2LQyDoRCdFtiiSTvib1t+oMkOL8UUUH0pKoN+B09GnosukFDWS07w
	CSTRvV8esDl6YTiRdx+A9k1LecmsC+l1yPfYi+lgb8trcHxpj3E+Dko+68EJt91GibzdfWn
	MX5YvC1HieOacVFLBBBQlFfFhVRdfVTL3GhGv4gDMU3DJcw8MWrS6J46mt2r7Mq3jtS+auo
	WLLLav3HTNhasC7Bdy1L1ssrxGtMuwvrIAvaKJVGX8+But/bHdSxNghNBH2xrZvaCz3y+TT
	qexPdLDO4KWV2XNw+WULnoCA+b4tsin0gHFqhZWOuXy0YTnx4AjuQ406kPYkwGt4N2LU+Qi
	avDIFHEJIAb/r0L1D3Zx/XIv/9/eey5CetQPaOZQvHkH5LDicGXCQY=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

Clearing timestamps on error buffers prevents clients such as libva-v4l2
from identifying the failed picture and can cause synchronization timeouts.

Preserve the firmware-provided timestamp when returning an error buffer.

Fixes: b791dcfcba3a ("media: iris: Add handling for corrupt and drop frames")
Tested-by: sakimidare <ssmzhn@163.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/media/platform/qcom/iris/iris_buffer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
index eb8de60c1177..f790483d13d4 100644
--- a/drivers/media/platform/qcom/iris/iris_buffer.c
+++ b/drivers/media/platform/qcom/iris/iris_buffer.c
@@ -899,7 +899,8 @@ int iris_vb2_buffer_done(struct iris_inst *inst, struct iris_buffer *buf)
 	if (buf->flags & V4L2_BUF_FLAG_ERROR) {
 		state = VB2_BUF_STATE_ERROR;
 		vb2_set_plane_payload(vb2, 0, 0);
-		vb2->timestamp = 0;
+		/* Allow userspace to associate the error with the input frame. */
+		vb2->timestamp = buf->timestamp;
 		v4l2_m2m_buf_done(vbuf, state);
 		return 0;
 	}

-- 
2.56.1

