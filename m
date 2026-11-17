Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948594;
	b=rwsJLd4qJZ79ZsBM1K+Xgdg+xIeS61yNG64bAWM03e8R76mY6xdXwh0R6IOFWx3uAI7f
	 OBAIJHorLbiMJPsz0izEIxyhAZgQbt2oNvybqNuBXBc5vJaGwY0lb6no9aR6AwL7J8Def
	 WIWmDsOrrnSQdWv13NAo6goSpIbSb1jtvqrbJQht1UEJyqhOA3YIOtZucLevHyNnkZfZY
	 SPlQ3XeiAA8Fdx/PUcn7DgUrPgVYGgW3rXajeAGqbrBjQPojPQeKuRihifS+830kcl+8z
	 uIFDvJEBJRM2E4nG88z/zd4s3T9qQJgRfsg/57SnP9cPDl4kzsIVKKzD6VNix/w7XkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
	b=hcnduaDZapVaMjqLAkBnJnn6ol2y0Ce0NZF7w8kJwqBPfMnNZqC+QJYz6bFNZ0XrBUFb
	 Z7d2++UmvziEdGpRQsjSpcXDNiS7hpq77x6jU4PyNkrUnV4P+f1iDsixOUVLg0HbHI0Lz
	 iqiJIM5LcDP1BV9uOxVUgeFS/BBtf+0EHJRPSU8IHs9rGPkK0ipED7WxTWgCOJWIvWtNL
	 uwyMY74DBupoDWyJSLos0OLQFYDBzgrooAbrwtscVY3camPd5pYb64M3Nwrsuv5Ns2zP3
	 EjMrQLmiZU1/9lzWsRJsyHiynyMkU4ClpMy0G/9/87YcqqoLWoy7YCprsaJuwjE37Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Cem4km;
	arc=none smtp.remote-ip=74.125.229.133
Received: from mail-dl2-f5.google.com (mail-dl2-f5.google.com [74.125.229.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16D5606A32A
	for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C16D5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Cem4km
Received: by mail-dl2-f5.google.com with SMTP id a92af1059eb24-1ac216daf7dso56464c88.1
        for <linux-media@vger.kernel.org>; Tue, 17 Nov 2026 12:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948593; x=1795553393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
        b=L8Cem4kmYuHusy5msUQWLAqRF5dfQXadzTcD4owreV8CgrXMHJEVYuKm6pMlmDu5q7
         9vgzQotO+bGKfZjuBiPM/mkyMHuQTIjYI3HhEhwsv2ZYPce1PmBU6a2OMxG4vgW7A1V8
         NSpCEEIaZgUFL9Vru4NHSeVFDQv/OY5z3rH5tUG5nNNqu8Ndxzy4UVx1d5foLLg8YsQW
         nk6zVOrxBEHUI32Jur3tuItF0bZhbOloX4yKg+FpfSga7SovmAzUV8T9/oiWW3pfDUCz
         A4/rdg5g7mJ1xbDuN6TcUsZZLO+UORhmG2aZcOXgx224+NVkgxJSaLVWAwXxoO6Zojxv
         QZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948593; x=1795553393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
        b=tHFnOokAdgs8tJ+aq4eS1aRxCwDu8/hkNgR+s2vIcNMeAzaEEOl/Tq53aXNDcvgEMy
         1XkU/Zfu55AQZk3gfRuJXL6xAiRDBZuUVTBNJ1VrXztLiOQhzJHkAFPJmJcK+jiCr7GA
         hZj9p+kL0/es7ZC2vbEpDtiL5hvE/AHx8OW5JZPbY7EyigPtYpTvZn4nskRy2rzCdMyk
         2fIHyAymwaZrHJaCF7GTzb282LviDzs9gT2wlM4tVsBc34PpR0uOe5D4OAfdCA1JUquB
         7Fmu0J2GUPebw9F+hr2XRrE+HnjhwKJO9AZXQ9CJESKYFNVQ7jNRzFYTebvGiEoeME61
         zGeA==
X-Forwarded-Encrypted: i=1; AL+hErHxDQoEKu0qP5UoQVhbx0VajxnatJ3d8ApMnowwu8ewt6GgFHEsye07hbYwOZ4BrNyiciCdC/cNpYljUA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8HLJEHxELAN6+TBrqVBY41RKRRdjYU69Ki5ny0sI/a94YG85Fg
	m4+UhbOgultYr+LJgL0hQLSb6NftbH4jkaBWztc9yIgfvj1WxZeg+dmv
X-Gm-Gg: AYBFou3fVpNciXbqt+EWjrlwDhVvbZejw8cEj0z9a4dijsLbSk+iCQo6rNXLxozHp07
	SOqNgQm19ntAJxEQhuedUvLmhAxf4Fv3tQggg7dQ/3U4wVWyFUZDswcU0XwFLqAaB4jK+UkQx5z
	MeVhRnrMU4UdTIVbA0enV95EMUlp4ywr2gBtg6H4xshKvOCFT6BLDm15Ui2lWLt4LFETDKWCvgC
	wjxvEOWyteTzCU3cb85u6hH8SyEcfpdPwmOz3ViYmenpgE44Tk/RteY8P5voob01E1Ui3LxWV0k
	MG3CkahxMNi2r6+PxS1TGX4DgUV37D9ceg0xDjoD42CImkwfA+6oJguIvTyTVh/FI4Qh1ReZtvH
	3ja4b/HdJNGdAn+JJOWsYbg7rfZTpm44BwMo5jvpxKBZ11lZnuh3mK3/Jzf2t1b43XMShmthobj
	Ww6Um5AR4wuMeH3o59Ewh3jojpB+3mwE9rS0fblEKiA4AszNixaTMy13gJM7kjTYkF1yJ91AFbD
	W1jQ01AkL5RETg7P0IaEWicSVD0JU/UlVtYCqJx2bJrh+Uj2Igs8AJO50TnWLFK3WN7Pefj6cJy
	7SJ/lBZe71TuGoejlaNhupKSDDN1RCFxhNZtYcGqa5zjcR+KeTq6lp7HuGPWz0zSq33Rlniq3WM
	bb6w2sqNvKF5oQk33gMaCPSf53So//rn12DWsWA==
X-Received: by 2002:a05:701b:4348:b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b543d04c19mr547908c88.34.1794948592840;
        Tue, 17 Nov 2026 12:49:52 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:52 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 0/2] media: iris: port two packet size checks from venus
Date: Tue, 17 Nov 2026 20:49:43 +0000
Message-ID: <20261117204946.21359-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

venus got two fixes in May 2025 for packets that the firmware sends
through the shared queues:

  49befc830daa ("media: venus: Add a check for packet size after reading from shared memory")
  06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")

The iris gen1 code has the same logic and has neither of them.

Patch 1 makes sure that the size field of a packet did not change while
the packet was copied out of the shared queue. Patch 2 uses that size to
bound the walk over the properties of a sequence change event.

Hungyu Lin (2):
  media: iris: check the packet size after reading from shared memory
  media: iris: fix out-of-bounds read in gen1 sequence change event

 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_hfi_queue.c |  2 +
 2 files changed, 56 insertions(+), 19 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

