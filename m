Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793751553;
	b=SnJfgsujpWr8sJQh5UAEC2CJ7BdAUAoWbWB67j62up2B6tyvmYCJbC9mJpFb/GppK7Mf
	 c6QL7J4bj82fW6myFAd4AhVCcjN3ZxMwbyg9CL3R5olNfdxjJUV9fge7CsqcAMKy3i/cd
	 a1mPTSrCrRkbppgLPpQ/3rX/f34mDrWCoBy+3EnADiORKkEVY9UlCpx0jXlNyESqqxVu2
	 RRiSY69OpXxGh24sOi2GjB3A/4n5Ngqt0a7HdL5igkoKmFUQXmyOiZhXDrS+pfQtkeL79
	 tN1+zXva2hPGuTujFAMU3p//fNxjI8HQ/uQ3HXer3h5GoLAXfqGiuv+0tVFDLnDYSpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793751553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xkQ2a4rr4OfVHQ6kuJzVvVdC31NeQtZjjZjX0zJeTWI=;
	b=KE7QeYss2KWighCy5iAPiMMjVrN/fghEJdP92gHGFib8hHaqjakDU6sBSLe0dB121O7h
	 sAMCbLf5pD7/rz5+xxqoEC2Lbg6hlFMZE21hCTwf/SOfaGkaLVleKTRxmFwWJDNstCJPw
	 RkQr2NXfx/0bfUm6V28yoeqtLtfT45uoW+i7hbeb2j+DonJ2edfs/D5mKp1K9hBbUxIqu
	 /dza0tmIjZ7K1FWspYHihqp/LtS93m0BxvytimGn9/5QncIkUwfz4mJow5d4XeiKurWGr
	 y83zBCtFmp+6R5j113904KqvB/4c2qrISUkXQcfeEsBUVFQUWGnsb1V7vwnzKTKnh1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nua3l3Lz;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66431606A328
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66431606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nua3l3Lz
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a5720b0a57so7885795e9.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 16:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793751552; x=1794356352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkQ2a4rr4OfVHQ6kuJzVvVdC31NeQtZjjZjX0zJeTWI=;
        b=nua3l3LzXH5sC9A6SJ9iKsthhz+gzmmes08RfX+Km6fub4LXy2WKga81YLv/KZCWh8
         aXCZIIS81A56KCQkdxYaQNk5KHgirFO47zSnsfkrTpI8Z2AFJ47Q48Yw6MG+mXUKNu9J
         7EYoJk7ILdJjyCu6Aejpdt5y38qkkDrNjk4xAeA3yIuYCixIdbBtd+K62+4bta72poy4
         GWeWprgrZ9BdD55agKUAF1VFYRsPQrgK703f6xRrYn6zCVxoijW2mmd95cLOAZyFHT7F
         WT9RigCUK7rGvk9in63j78CQ5ytxfWfGFNCbaMfe6VQIjtgNRpE7kyEJsYjkXjeukJ30
         Lm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793751552; x=1794356352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkQ2a4rr4OfVHQ6kuJzVvVdC31NeQtZjjZjX0zJeTWI=;
        b=EhRRnDtKUw8mnpJHuKpdJNyzzXxKp8BIfQf9EgTdWZC1VxKYdT9iAl9WDFMJQXxtEF
         VSyLzShRY96mSnT1vEcOUql70kXy9CwbSW2TV5CUfSDFlSMfbO88ZJ/FLHavlDbT41/h
         K40IX2BSlT1ZJV0kv0nP1FN/rx1BHX0bg1R7NXtYQH+4E6XtgFqwUDWEapqdVphOv7tu
         59JU0VHXEMkXKFNi2B+c8fyvDA8oJbyBHwEuLAeB3sgpUmeNZifQUC2kEalqjxrh2jUX
         3LRPHKzqXo+xnKn/ARuXo8tNeB8XuIQHfL+4aOy9I4Iql0446CaVtZ/TihklSYft829D
         6d1A==
X-Forwarded-Encrypted: i=1; AKwUvBxdZsBGAN6ZBskpGlQvc3OUCZ3q6MmC3mZh5SJmF0Wqk7dhVMHi0BpDsrCxAAsEllUeBUD/ciVtAbpavw==@vger.kernel.org
X-Gm-Message-State: APuU4Z9FQQmw1d22s4Oa+9kj9nVBmB/th+eQMdVeZWEcJiKu3kXuxYvi
	6iOZbHqHTJOQkCaIlkWF53TdHsxRGZfFJGnelMN9cIKVptSSchq3vlO6
X-Gm-Gg: AYBFou0O5vUu9hANsuapcZfsYI5gr12lvvILGNdie0rwUfndM94MJCqemBb0MB2HoJv
	zM1mXUObVpN5rwOZDaqFrFC03/wY2/SrU84f/izM60ZlOeMN03yg4q/OO9m1T5MhRTgJ5Ty0PU4
	LZQ8Lt6eF2LE/I8vN/tzVzIQ7f+ERpcN7CSpm2kW8JsNh08Gojhe8sK3dLu0Ac19KwTQld4kDAp
	PUgkG45o429x/DzPl8wNYa9xt4VLw7zSIXDpW5HC6Oiqv6xm3TLw8DoNuGIvu2YkdkWhh/kcHUr
	QSmCm9Yuia/c1QLS9iLVfp9KVhYnT6caLRwlVupdzoTEokNac5xjWrhbXONN0oqE0efCpS+7fxz
	aYj8U9ukL8iVoACn7xBpVwM7jxeLlKHE/cMjTuQsjAX1vBfC6puzsOo9/Pxka6rU6mphWUVR4is
	AXRLB2eKBHpQrOenuaetoSDWQY54b38OnmnWtZqQIji2SnqwNLR77OvXHYknAD7Ts53GtolZVx2
	LNvBA4DjkcdGje4lK4sDYzmfmB1xxwCCum/gj2KxkqMony5QAT+sk1CMLnSGg3K69iC3hOiTpJG
	qTAdhRiq/JBfadymFOgtkGLhE+aKt/Y+GaYoJH4Z78uloNMIgOp/u/UgcuSxYB2fVlA2DTrLVel
	Jsav7Gk3AhRaMno1Gr0hW81WtFcL9cTKC
X-Received: by 2002:a05:6000:3101:b0:48f:bbb5:61c2 with SMTP id ffacd0b85a97d-48fbbb563a3mr6701949f8f.4.1793751551597;
        Tue, 03 Nov 2026 16:19:11 -0800 (PST)
Received: from 127.mynet ([2a01:4b00:bd21:4f00:7cc6:d3ca:494:116c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda1fb0esm676676f8f.49.2026.11.03.16.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:19:09 -0800 (PST)
From: Pavel Begunkov <asml.silence@gmail.com>
To: linux-block@vger.kernel.org,
	io-uring@vger.kernel.org
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	Pavel Begunkov <asml.silence@gmail.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org,
	Nitesh Shetty <nj.shetty@samsung.com>,
	Kanchan Joshi <joshi.k@samsung.com>,
	Anuj Gupta <anuj20.g@samsung.com>
Subject: [PATCH 0/5] allow dma-buf-io ctx reuse across files
Date: Wed,  4 Nov 2026 00:18:56 +0000
Message-ID: <cover.1793751001.git.asml.silence@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Currently, dma-buf maps can only be used by the file they were
registered with. This means that we can't open a new file, even if it
comes from the same subsystem and point to the same block device and
use it with an old dma-buf registration. That would be too restrictive
for upcoming filsystem support, so lift it now and allow reusing
contexts between files pointing to the same NVMe, even if they refer
to different partitions.

To do that, we add a tag representing for each file, save it from
the file passed during registration and use it to reject files
which tags don't match it. Tags are set by subsystems creating
files, should be unique and represent the instance of the
subsystem.

Pavel Begunkov (5):
  dma-buf-io: add tags for sharing ctx b/w files
  block: set dma-buf-io tag to block files
  io_uring: add data to dma-buf convertion helpers
  io_uring/dma-buf: switch to tag file filtering
  io_uring/dma-buf: get rid of struct io_buf_dma

 block/fops.c                 |  1 +
 drivers/dma-buf/dma-buf-io.c |  3 +++
 include/linux/dma-buf-io.h   | 22 ++++++++++++++++++++++
 include/linux/fs.h           |  6 ++++++
 io_uring/dma-buf.c           | 19 +++++--------------
 io_uring/dma-buf.h           | 24 ++++++++++++++----------
 6 files changed, 51 insertions(+), 24 deletions(-)

-- 
2.54.0

