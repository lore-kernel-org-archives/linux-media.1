Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792840;
	b=LkXcwMxm7N0ktVm898/G31KTPbNn5ZGbvUJgk4E3tM8/ndaFXUzZ/uqfwL6ZWp9tqPAK
	 WZwNOzfKpQHK1BNWRHnuewuIITnGFhHB1rfxEUrdOIT8rgkL4exmEefVV4O4ObmXpCUgx
	 zQ2Ett60JQyPTOZtPnxn6BgiE5SbjrcbzPkf5VISS/hFgJ8P94PRgEZuAllrDqo4RV1W0
	 IBDtlSjrfmA99vROS9n/eVIGp4RnXtOEfE7Xp8PK9rRGRXuC+FDWiAkOboB2NDLLamSKO
	 oPCD9PjqtbIHeaL1lqmRXB0zevD2d798A4w14KlNV3mZtjg3caJJW+mZDsmgmhKsgfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792840;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-CM-SenderInfo;
	bh=Z2HFeDIZKxBehZmXft2LK29Tf53sWMhpAniHKu0N03U=;
	b=Pc6g/vpQW5dNz32G3PEGuzi4Y3RmaQtUbut79mJsMfiwmetBgsD/DBgfkwYr8nSYfiUm
	 tMRp8A9KpQ58q2xWFMJ5+3Dux6k1/OoXaUa+7pgeP+TKGTYGShHhQWkNAEUQ16I//mDAt
	 vy4AfrgxuPjmQ4LYP+DFWTGddgfu+cIn9uHtRoC/h+3rRBeoPdBabEkMj7+/aiN9JK2w5
	 HOggHQ+or8JvzGx1ZnSJpc7PkAoy/aSZACh5K2XsTENEfSyzAS6yyUl0Bb24LPiK2hj8Z
	 VjC2Rk/rsFA/FW/2Qvd5sfXydVyYvCQ0jUPirfGCRKq11B3cs82Ihsy45mBBzoQdXNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TpaFP6zQ;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AEC3606A323;
	Fri, 27 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AEC3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=TpaFP6zQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:MIME-Version:Content-Transfer-Encoding; bh=Z2HFeDIZKx
	BehZmXft2LK29Tf53sWMhpAniHKu0N03U=; b=TpaFP6zQvpWqJOh7m3nILdbPtv
	uDyXpC/JSEIfVL3FKPtbQ7U0jVHfP1Gh9KVYfL1pg6Fbgxmpq3IemcpvsGxm6VZz
	prfp7db6rkLColTjpt72BxPaROGpSq/yiBjd2obKQjtoI6Ev6+TGHED86Ll65dnS
	PEOLiggwPcv7wSPic=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnMke4nwlrB1EDAQ--.2959S2;
	Fri, 27 Nov 2026 23:20:25 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Stefan Schmidt <stefan.schmidt@linaro.org>
Subject: [PATCH 0/3] media: iris: fix v4l2-compliance format and cap issues
Date: Fri, 27 Nov 2026 23:20:21 +0800
Message-ID: <20261127152024.2149804-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCnMke4nwlrB1EDAQ--.2959S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1kCw4UtF47Ar4DurW7Jwb_yoW8Xr1fpa
	y3ZanxArs7Gryakrn3Zw12qa43t3WfGasFgrnF93srZF15GrWIqrWIka1vgryUGFyIva4a
	vr12q393uanxAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxkF7I0En4kS14v26r1q6r43
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5QZ2DUUUUU==
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAssZ

This is a small driver-quality series for the Qualcomm iris video codec that
makes `v4l2-compliance -d /dev/video17` pass the format ioctls, cropping and
composing tests on a SM8750 (vpu35) decoder. On our board the count goes from
39/48 to 47/48; the single remaining failure is an unrelated control-event
question we have not root-caused yet, so it is not addressed here.

Patch 1 fixes the bus_info prefix. Patch 2 fills a self-consistent default
colorspace so G/TRY/S_FMT round-trip a valid set (and stays idempotent when a
client feeds G_FMT output back into S_FMT). Patch 3 seeds the crop rectangle
when a client formats only the CAPTURE queue.

I could not split these off a real upstream base: my tree is from 2026-10-14
and had to backport the decoder source-change series on top before these
changes made sense, so the context may need a trivial rebase. Tested on
SM8750/TB322FC with the vpu35 firmware, kernel 7.3.1.

AI assistance was used to prepare these patches; I reviewed every change and
the testing/measurements are mine.

Qianhui Xu

Qianhui Xu (3):
  media: iris: report a platform bus_info prefix
  media: iris: fill in a default colorspace for decoded formats
  media: iris: seed the crop rectangle when only CAPTURE is formatted

 drivers/media/platform/qcom/iris/iris_vdec.c | 50 +++++++++++++++-----
 drivers/media/platform/qcom/iris/iris_vidc.c |  2 +-
 2 files changed, 40 insertions(+), 12 deletions(-)

-- 
2.53.0

