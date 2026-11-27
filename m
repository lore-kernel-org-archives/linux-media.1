Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795792840;
	b=JUKh0CzGV+6vQUE1wSf/sfReBvWGpcw6KeH2U9MwDi/gN2Rapfk/gkqvqRT6Dit2Knph
	 I7AA4hBAKC3LHUH63O3uiATOVzoxXX8T7CcaRS9D5LZ8qAcK/BiBTjINH8/0OB9HKiw63
	 mpqJUrM0ospdyg5z+FiKTMYVX+RPxT1wMPs0sHVfAgK+7+wdukl+Om1dDvMYhWP2wCIHz
	 OniNIXwqtJrB2oXn166hcp/x61iP2bZNluXrYniP2Uo3gdhFKT96B0FMvg/ymvT+fyO3F
	 cJxAEZMSwuphUS/azaXEwK2HXfRzMMRd6vixEwOgLC3vnlslPfhPf4Fcmyju+l9ClCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795792840;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=9Ow8Vx4ve7utxk43EYAIvtTIwB9HiNFVy5ocA2uOO84=;
	b=gemElLYjnJ+WS/QotHUaDV0seBWtovhRjnwVJ24rlQ+g6B+FcKQoKYlmv/sOfiOJztMV
	 6QITUeG6WB0ia1cuAXX8B3AQ62bSbXWfP2d3NbYCp6sw8nyRVDr8ebWQSk0HCWY/LC0CO
	 aLXCVJ1w54GzTPRmYWGaUgs69BW8IKdZ0OBUZrlM1TuVMMrVJUcYy5slnpYbV1PHE0njQ
	 ASsNE3+WHuOgj+cyMW9dALxjWQydRThyRS3+nf1pkqW6ODJuBRVFqQXTUJrclOLo+ndoM
	 dEdA0SGw7xk0S9iAtu0CfJ+bbrGcsroEMkI7PTt0LmiHWvz9BPlBVi76aE9BoWXzZxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iHU9oFp+;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F9F606A31F;
	Fri, 27 Nov 2026 15:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60F9F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=iHU9oFp+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=9Ow8Vx4ve7utxk43EYAIvtTIwB9HiNFVy5
	ocA2uOO84=; b=iHU9oFp+TekRt/94wUaalFbBeUtctirUSU0RSuPNr0b32K5tFD
	jQFEqoI86TSW2LPZ7Eww0+WW8D3Jbg01JAtGqxcfIfhkMlCZyE2eg6ti1h1kuwrq
	k+OoeZftYQaH8xRiW869DceOuNDpCqnfs0V31CxdzDcxKfrcbwj0KzfWU=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.180.66])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnMke4nwlrB1EDAQ--.2959S3;
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
Subject: [PATCH 1/3] media: iris: report a platform bus_info prefix
Date: Fri, 27 Nov 2026 23:20:22 +0800
Message-ID: <20261127152024.2149804-2-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127152024.2149804-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261127152024.2149804-1-xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCnMke4nwlrB1EDAQ--.2959S3
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr4kAryrCFWxXrWUGryUKFg_yoWDZFc_Gw
	n7GFWxWr48Ars7tw4Yyrn3A3srXrsY9r1rAanIqFy2yrW5Wwn3J3yvvr42qwnrCa1vvFnr
	CFn8ur9rurWfCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbh8YjsxI4VWxJwAYFVCjjxCrM7AC8VAFwI0_Xr0_Wr1l1xkIjI8I
	6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7
	IE14v26r18M28IrcIa0xkI8VCY1x0267AKxVWUCVW8JwA2ocxC64kIII0Yj41l84x0c7CE
	w4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6x
	kF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I
	8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCF
	s4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20x
	vY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I
	3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIx
	AIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAI
	cVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2js
	IEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxU4ksqDUUUU
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREDB2sHyZtdggAtsY

v4l2-compliance rejects the bus_info because it does not start with a
recognised bus prefix:

  fail: v4l2-compliance.cpp(669): missing bus_info prefix ('plat:aa00000.video-codec:dec')

The device is a platform device, so use the "platform:" prefix that
v4l2 core and v4l2-compliance expect.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/media/platform/qcom/iris/iris_vidc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
index 1edd2a4..9634f4b 100644
--- a/drivers/media/platform/qcom/iris/iris_vidc.c
+++ b/drivers/media/platform/qcom/iris/iris_vidc.c
@@ -466,7 +466,7 @@ static int iris_querycap(struct file *filp, void *fh, struct v4l2_capability *ca
 		info = "enc";
 	}
 	snprintf(cap->bus_info, sizeof(cap->bus_info),
-		 "plat:%s:%s", dev_name(core->dev), info);
+		 "platform:%s:%s", dev_name(core->dev), info);
 
 	return 0;
 }
-- 
2.53.0

