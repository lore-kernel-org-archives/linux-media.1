Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793756574;
	b=UIDBEIXhWyXR0xx398sYn5/Y7oaDuGZgO5ZH2NFX3aAU9cPcMNqFOXjoNUGxZs9DY4hQ
	 tS1zD+lPJ6A28lhxNnvY6bhc9G+0d5yorDPp/o1bXldsfCVoKFxZIMagOrIKdvJMdszHx
	 woBI0kXkZ0+fhIDxJJFLYr3JDUUKUT156xaJnrUybAt+WaEyNcM59nO7eikXEUyPyeaQm
	 Zjn/8Lpm6RGgxr1j8LeC5AzHbU0XKFrnDuwiCm1bFAdVbt+P9rsQzwwhXWUJ+6FhBxnaE
	 r+6IRMGmtjpxk2K78NHrRJ1kGwHHBtPgmDzhlBlZ9MHoK9A0Iq2BwVQkKV8UlglEXGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793756574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=04qjylQiRjUxab0wFGioKpg+XzQ+3wNYfPCFHSRebIg=;
	b=2S+KZfKASXRLePyiUJmgbjQyko+0DfUII0yK+G2706ZhUejVpK+AUB75UrqDXUksIVzW
	 5scrrhWE2hUyaBk+H3WH1fDFxyxObtDUc644xdt+fxRSpwg7UU2Ai8v0Pm2tYhd/2uqDj
	 b5sXQMs04zyPx9vi9vsp+4xc/U92qJq8/INlBpQ2cc53IzlDCR83YGPRysxZcqFcdk3/O
	 MX24k29OLy0E6vjCcDiipanuu+JQ9OQquKx8+akmANX7KWmP6gI3MJ8mBJHNw78e34DVn
	 X83YI2a6bSS8uRi2MsoswnOljs8ebixkFvLBpQxuP1QKvOSUZktrbm99WB45GdN/5Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnZ5cWJ+;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BD606A333
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 01:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B40BD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZnZ5cWJ+
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so869865e9.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 17:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793756572; x=1794361372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=04qjylQiRjUxab0wFGioKpg+XzQ+3wNYfPCFHSRebIg=;
        b=ZnZ5cWJ+ytnymUUDiWLTVDB8LUTx11Pe67lDgEa6UTMikuPe68RtvMTSngvvG/kQTZ
         zDW+WxILFmp5F9KDBr8bZ75Du8TzTPUcpFIzuzO1RlOJ4dCf1JMNDKjZXKeuCni92DH8
         LV2A8/2ZiAOjNVuhXVEhHVa75+tQ4F/OWopgV+krqItDpK5BawAZn5fHh8JXk7wgQZGC
         eUqFXjsoN77aU5Y6b6d/3e68Dyj3/lYlCdkhISVvTHfvZz5OaaEkExil5VEyLaShdqGu
         GC+wwPZbki+kaZLg3qz1MoSCl8tEssvKKP92k7ba8KFQhfKls9TS1+HIul+I1aSQ7plR
         YOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793756572; x=1794361372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=04qjylQiRjUxab0wFGioKpg+XzQ+3wNYfPCFHSRebIg=;
        b=fVwAvNfysZ1wiTihT3G7znHv7tHWxQ0dzJoSvoQBxczp7csO0qfLqYws9gpvK8lspj
         7iDMNT0NMhH0GUOCAveimu9T39gl4CTaYb3eWDZAOlM3Ju92iJuX9q0G9RshUSz3HUJV
         M9XElNsvKD5nEpBcQJpxXVsFJ/J0WajrksQQI3i0ABhuenHFX/HEqppAKKeqtZ9jWZcp
         pHrD9b6Ndj0DRE7zYy4ndS1Uk0/aR6NfVo0qnvQNGMTygMltpK0jQrnKK+41NFP0qtF7
         4H9NPp6C1QLuKoo7Q7Nrvr4e1+p0KFNirk08CneLc/YbKsjhgsow1iKYTKUZC7gNcyJH
         dVSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFZ/oB+9JcyCqyX7ahYa3A26X/rm5Ww4qz3fttK5KxG/oVYxd5F0SvsAf0psY6FLOm6hO/PxUceHCvKg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8Hk4e7k/DtYb9VlKfsP8fhfEO0uvC+KJbf8wtyvv7A5XQJ5Lc8
	H4GTsv8I1hVn/zfmXHp8TWpImKLRgCMMqLdQGPgBgXzCWZ7fns0zMiU=
X-Gm-Gg: AYBFou0OXiukdB9ryzOnyXVImeA6KDFYbxF9twoX41AFJhC6lwuI6xQCPXtZslt8oNL
	iyDDmQ9l7sU+InJAE4Cqh9tlpfY4s5KlhUBdxyHoCGvTbjLt3uFhda/Qv4bfWv36B9ge9rRXQKc
	EDWwsUgRPQxqjRNo2b8f0BCTMRqJ735YDqtzaoK2QytCCStcPIDLypNIy7Uu44HrFacowaa8k6i
	/jPQPrKByaUZa/C7MfTrTGoUz6G0xFT/44MJ3ONWQWiWg1A7h+3asCZmC/fhmgDtKlVmd9oU1Yp
	NjaYd2wlRX++yqk+8PVvyEATKE4yb+XUtdIc0yVZaB3eSe+ibJgD1hocAunXzUmKllsIhjpmyEK
	C5msBNYB4mZMH5OF7KA1RAmy77zctr980cStyzmJ/2/FqGA7CgpwCKAfugwJ0OHiksKP3l6yMgf
	VRTyxbQof/0OSVzm75KX7W/GGXAzT6SYfMxv81rnUPVjBkCP8dwqIUhdvhVWoRYjiqbBSRT+4Fc
	ICP3fxBj8qvdqPDBQQy8Di/ZOWzdz1dX3ePYOjUbyJx2hrEO52DB+eUlcL/pHDJe2qXG+paxmaV
	nkrQyPP4C4s=
X-Received: by 2002:a05:600c:4ece:b0:49e:65f2:db64 with SMTP id 5b1f17b1804b1-4ac169d7e39mr333856735e9.5.1793756572002;
        Tue, 03 Nov 2026 17:42:52 -0800 (PST)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feeb5196esm885532f8f.58.2026.11.03.17.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 17:42:50 -0800 (PST)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	linux-media@vger.kernel.org
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v2 media] media: v4l2-mem2mem: cancel job_work in v4l2_m2m_release
Date: Wed,  4 Nov 2026 01:42:48 +0000
Message-ID: <20261104014248.3761373-1-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
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

v4l2_m2m_release() frees the m2m_dev struct without cancelling
m2m_dev->job_work.  When a job finishes, v4l2_m2m_schedule_next_job()
calls schedule_work() to queue the next run.  If the driver tears down
concurrently, v4l2_m2m_ctx_release() invokes v4l2_m2m_cancel_job() which
handles per-context state (TRANS_RUNNING, TRANS_QUEUED) but does not
drain the device-level job_work.  A pending work item can then fire after
kfree and access freed memory.

Add cancel_work_sync() before the kfree in v4l2_m2m_release() to ensure
the work item is drained.

Fixes: 7f98639def42 ("V4L/DVB: add memory-to-memory device helper framework for videobuf")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
Changes in v2:
- Expanded commit message to clarify that cancel_work_sync() complements
  the per-context v4l2_m2m_cancel_job(), which handles TRANS_RUNNING and
  TRANS_QUEUED flags but does not drain the device-level work item
  (Nicolas Dufresne)

 drivers/media/v4l2-core/v4l2-mem2mem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-mem2mem.c b/drivers/media/v4l2-core/v4l2-mem2mem.c
index a65cbb124cfe0..311e2e08d066d 100644
--- a/drivers/media/v4l2-core/v4l2-mem2mem.c
+++ b/drivers/media/v4l2-core/v4l2-mem2mem.c
@@ -1207,6 +1207,7 @@ EXPORT_SYMBOL_GPL(v4l2_m2m_init);
 
 void v4l2_m2m_release(struct v4l2_m2m_dev *m2m_dev)
 {
+	cancel_work_sync(&m2m_dev->job_work);
 	kfree(m2m_dev);
 }
 EXPORT_SYMBOL_GPL(v4l2_m2m_release);
-- 
2.47.3

