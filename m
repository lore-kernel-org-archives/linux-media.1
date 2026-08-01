Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA071EFFA1
	for <linux-media@vger.kernel.org>; Sat,  1 Aug 2026 20:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785617598; cv=none; b=aNisDe6gzL22r3udhjKoH+I5C0BnBS0sbJ4s/M9utGhNK9PamT6D7Tfk6XDGnap+vdr0nqOBgMGZZXO0C4wwmg8iAuT9n6gxWsUE5moISx8DacGBHBu4nbCNXDsfpAidgjl5h/IDVGXCiMCzG/YLcx6vQTvRnyZDDZ7RGSeRNJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785617598; c=relaxed/simple;
	bh=dK6o0Q/obrwoWi9xABYcRVb/E/bhl6I7IPIxG8HEFfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMLRUblZfdcQoiM1U/uqRofBBkE9ItvELkcFu80RaqYBkOie9GPj18E6o6g+NZJ0i8wyEzo3ZbbgIEwzBKH1DW+d2rncQWezg6mpQWd0bbH5+im3fw9LBg5XV8FK1d7WC7Ln7snAqnXWTQbLjDQym6Dljwrr86SI/HDiGGwE43A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iD44l97y; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iD44l97y"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f84023916so2199046f8f.3
        for <linux-media@vger.kernel.org>; Sat, 01 Aug 2026 13:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785617594; x=1786222394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OJKqmH8LLrrmklRKr4uQ8cBGv4eP4F7/njSPphfYAjU=;
        b=iD44l97yncgV+SYwSILMnmb+Xufhi12wfIcalER9leHYSYIMU0V4G8N/mKQ++cv52f
         WGtZWO/TEEJxyCF+wqw4ivf/WPATwUQgvBraJ+JucZ/wcc/GrqH9qmCSA9Wkwfvliyhi
         6j5ba1q8w7OmtYHUFX/vRz1kU7bnClENBMcdKpFMgtuabCaQubpEyIq1tFxwHOIuJCpj
         zSRhO6Bkm3+DuCBYew8uZS1H9aHCQGpqqGFmnq5cyN0aS48htY9ZoE4nDYfCm6fch+rR
         2dSgHtIpwAZUYEtePjKSLocM+bQ4M0V0HQAB4T8VUuhpv6tY6V7FzKocD76Jd8Axmdyk
         Lnvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785617594; x=1786222394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJKqmH8LLrrmklRKr4uQ8cBGv4eP4F7/njSPphfYAjU=;
        b=c8QiS4j7AOuLulWGgq2Z04mlzwZasFzIyUzDll4z0WHvQDk0hFcaAF3yOklQyWAv4n
         +YUURkFocsYeahZIYRv8lEXVIEdS5LmVFJE851zp2w6Pqh0QYLbfsewPCoZgoKnf0L88
         M4/tjAXsKqhLrOXlc6XLeSzuyBFpPc/IN7AeooQdJ73YhD/TS+mBcNDXyVk+HrEDZpX5
         7JnRTrvFvB+0vbQmRO3HnQOIstdpNrUkb6fImPUwofv6GVTOu1KRsiso+lWUO5BqQC7r
         UINtI4bXQkfR0n5m+Yl8C2pUUrKS5v8xs1OqBglufQTABpcOvcfrc9kWmLGB23cow6X/
         9JHQ==
X-Gm-Message-State: AOJu0YyvyEywaot6Tfyjr406XIXj0sj4sDgO3vh8M1QEk56yKDSUJDNo
	1yjEWwumtudOgwpkM0VBYpe/HxNsHQgGzIpKz+Su7D4+j3Jjq7nNXxik
X-Gm-Gg: AR+sD10VZJWzm7z8a9s1gV4otF+hN8ZpEH0gOkqvF0xSL34cNlwytw/2ueEU0+mWA/V
	R2Y+kmzH1Uf8rqCX7doTqZ+G8oFdowdHKIHjh8RIHJH6CZ7IaoIHOyp6YS967s8CLAYhLIQ0AUX
	rHlmf7U/2sRcWyjPzkxjfNZdLgEgXEE5tocXwSzwjtCEnXyjJ27Wx3iFIbux8HiJyr60iSfRIdx
	9nAlzwDFIOEFPP2F3ZG71+otdU24RgGKZRnZeTwu76TKjlWyLrMNmHyuSgFf/ksCBwWiPXF5Kek
	eQwlVQGF8QQdjCcKPe4qxFCSTsFid35OmcVC0ZXBciGrGOr8bX6PTe+e7yWDIkRlpKkIVW5b8Sh
	PPsLIdn9ktAYkOeEnTzMl+LlUBONkFJnqbS7+8Q8QfVel9m4v0v5vEndvQ7TiaiEHV1WQcQpvH8
	nb/er+KmGMBhBnp05hnZYvBa4DIJAFTE3qpSuWy7ldFeo+DBD//akwfBKd2JQlQOYgGZonhr9Vl
	RQ3KP74VCp0c/7EJ9GMrp9Klrxfg1jeSHylKcPCv36fissm
X-Received: by 2002:a5d:6246:0:b0:47e:81aa:3832 with SMTP id ffacd0b85a97d-47fd72c76d1mr8250736f8f.16.1785617594067;
        Sat, 01 Aug 2026 13:53:14 -0700 (PDT)
Received: from dohko.chello.ie (188-141-5-72.dynamic.upc.ie. [188.141.5.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cfdc6sm17900061f8f.8.2026.08.01.13.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:53:13 -0700 (PDT)
From: David Carlier <devnexen@gmail.com>
To: dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	nayden.kanchev@arm.com,
	hverkuil+cisco@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	David Carlier <devnexen@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mali-c55: Fix frame sequence numbers on dual-pipe hardware
Date: Sat,  1 Aug 2026 21:53:11 +0100
Message-ID: <20260801205311.386692-1-devnexen@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The single frame_sequence counter in struct mali_c55_isp is incremented
in mali_c55_set_plane_done(), which runs once per completed buffer per
capture device rather than once per frame. Hardware fitted with the
downscale pipe always hits this: mali_c55_pipeline_ready() refuses to
start the ISP unless both the full-resolution and the downscale queues
are streaming, so the counter advances twice per frame.

Each video node then reports sequence numbers 0, 2, 4, ..., which
userspace reads as a dropped frame between every pair of frames, and the
two pipes never number the same frame alike, contrary to
Documentation/admin-guide/media/mali-c55.rst. The V4L2_EVENT_FRAME_SYNC
event and the statistics and parameters buffers only read the counter,
so their sequence numbers stop identifying a frame too.

Increment the counter once per frame, when the ISP start interrupt is
handled, and let mali_c55_set_plane_done() only read it. Initialise it
to UINT_MAX so the first increment yields sequence zero. Hardware
without the downscale pipe keeps the numbering it had before.

Fixes: d5f281f3dd29 ("media: mali-c55: Add Mali-C55 ISP driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: David Carlier <devnexen@gmail.com>
---
 drivers/media/platform/arm/mali-c55/mali-c55-capture.c | 2 +-
 drivers/media/platform/arm/mali-c55/mali-c55-core.c    | 1 +
 drivers/media/platform/arm/mali-c55/mali-c55-isp.c     | 3 ++-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
index ff01553026fb..7e1190d7fffc 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-capture.c
@@ -476,7 +476,7 @@ void mali_c55_set_plane_done(struct mali_c55_cap_dev *cap_dev,
 
 	/* If the other plane is also done... */
 	buf->vb.vb2_buf.timestamp = ktime_get_boottime_ns();
-	buf->vb.sequence = isp->frame_sequence++;
+	buf->vb.sequence = isp->frame_sequence;
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 }
 
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
index fb81141d1653..be562156b295 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
@@ -573,6 +573,7 @@ static irqreturn_t mali_c55_isr(int irq, void *context)
 	for_each_set_bit(i, &interrupt_status, MALI_C55_NUM_IRQ_BITS) {
 		switch (i) {
 		case MALI_C55_IRQ_ISP_START:
+			mali_c55->isp.frame_sequence++;
 			mali_c55_isp_queue_event_sof(mali_c55);
 
 			mali_c55_set_next_buffer(&mali_c55->cap_devs[MALI_C55_CAP_DEV_FR]);
diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
index e128adf6ee37..39178f6a1bd6 100644
--- a/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
+++ b/drivers/media/platform/arm/mali-c55/mali-c55-isp.c
@@ -342,7 +342,8 @@ static int mali_c55_isp_enable_streams(struct v4l2_subdev *sd,
 
 	src_sd = media_entity_to_v4l2_subdev(isp->remote_src->entity);
 
-	isp->frame_sequence = 0;
+	/* first pre-increment at SOF yields sequence 0 */
+	isp->frame_sequence = UINT_MAX;
 	ret = mali_c55_isp_start(mali_c55, state);
 	if (ret) {
 		dev_err(mali_c55->dev, "Failed to start ISP\n");
-- 
2.53.0

