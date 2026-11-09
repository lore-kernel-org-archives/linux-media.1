Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794200001;
	b=joL6mdHdpVu+ffkvB2Yy6Xsg/WHPYM0xv7cVZ/g2kXNvyrB15Ys/HcdaK/MHeVbwPtqA
	 EAbSIP1yVkElvHOB6loVD89LHSCOIvufF9Gy61w1AEyQ4Jk/1/RbofV09YRoGhXr8DgXv
	 rDbWrGqFEiJ+ERuB2DBwV8/m3Tj1yJD3Iub2dHvFaRGVnVbLZRs9p0MWMVUeMroQEmcge
	 LA9OFP3S8B6frFlE5LDnzwghUN6OYQryu96hgT/91me9NJIM7vAjM5Pne4qNV7sCqO5Y6
	 xI2Qb+VTyPFP9oxh8Uj5pArPjMvXju5+RFtg9DLPxjkVN3S0Hps6Z97FQkJ2EFADQpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794200001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OVPWR8szOHg1B5tabceM6OrLtjIwXl1TZU2e2aNbhqg=;
	b=Uxpp4b3vaClxe+YXoo8syWVjlra/fjnYCmpI6zRrYxJ+AZyCMgLZ6utjmmRffPmDeRFp
	 newAO1JRF1yi3bcav0Blaa2mNZmdaZYqRGbn/bg2Yhfg942/W56gCr43DVA4Vzki4zGlk
	 qsZn5K34PVrs5+X4NSENPjgCY/sFlizXRM7qCyRrE0W+N9YgEZtbqyuSMn2qJapKK0Xzg
	 m8EbIQkadJqpcexMqjNNGVFA5o2Vg5iopgScNMrKtX5EWW0fJ5B7YqcKqRprS8jaXf7Uw
	 kT3oQfg0qMZL/Iwd28tOW1mImL7NyDEuSK6qH+HcfJhKsrZH3kd+72jOjxOkPHCu6Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY16YHLa;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023A606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 04:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D023A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qY16YHLa
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b244fb7fffso489907c88.1
        for <linux-media@vger.kernel.org>; Sun, 08 Nov 2026 20:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794200000; x=1794804800; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVPWR8szOHg1B5tabceM6OrLtjIwXl1TZU2e2aNbhqg=;
        b=qY16YHLaYcsSGtQaIHBGRxDeitfflTbWSp5Fg/cztpz7NzD9mnVKzqH1b5OUQZa8aX
         69S1+iA33pi9iwO6mVSLtiRWYlwek60/xHCieXiR84UowCyP84KsBIqoW+YV6Rj4xf3F
         zJYu4QTJ/iDEHLq3MxUw+pcnhP6hGsx7tKN+ua+TprgS1T7F6m6VkDk64IvrxT+nnT/y
         Lz+IRCAK8dMgqR5zf1Hfgm510Cuur0f8/CO1+3iKBrzTdilakBAsGtJ0xJNXqTYcSRzJ
         pyrr5t0uoA728okiY8D7sUXje4KiXpgR8eJNE5vhSUvbJ7FVIJPpg+SHrxpdRfVYLfVf
         +oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794200000; x=1794804800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVPWR8szOHg1B5tabceM6OrLtjIwXl1TZU2e2aNbhqg=;
        b=bAXeq0GiNusWieoPmUFKBoSdDaEfhznsf23E4ur6bHT82DcBHXCwJ6pOSZhVV9wH/g
         hCHo+aRMNxM8qaEwCQBrbMag0lxB2GpyVw2CPiV47i79Hm2MnoJRZPbDDRWhE997kkg7
         5gv8WIhw4+jIypSUkANjqupqDwQI8rW7d1RAT59lFWB6gBrtALwo5B4KSeO/A//yc9I1
         2w2w7koHnzQrcjcJPhUB6xT8L0rZFIk8o4pCINJvqC/JdtD5Y8E0XtMubKR1sJFEK5IJ
         krrF6UlsJnRTmTgVZDq9NkdHPBPC3lwg5WMcwFpxNs0fEXdiJP6Gmo3N+imTH2kbLRDL
         bphg==
X-Forwarded-Encrypted: i=1; AL+hErEYNN4o9EOGr1ReB/S22SaanfjFE49kV3D7J6bLqJyrWX1cNHoC7072lUwfEqtkqtZtZh1uheOu7K57Zw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/Cxsy0YzPheXS1gzN3WBHMZx+uYyqZjgygJWDOLkfy+8ntkdRd
	6gIC3kALK5xUAW+B6rorCi+5NvYSxUNUYEmdBlXsYqrizkB6EHXdeNl3
X-Gm-Gg: AYBFou3pwnJpSxFI/VXYGIC68KiNs6rL/RECsdGaXYhSOEVdYuNjQkXisWqi5ME9Dt1
	etW3JyrWNgCBlvjTuyuBL82Hr4GEp6KOZb3cirRvj14RuSEWmcpiE95tioJj5AvO3UnC/zx7hRD
	KBeeqZ7rBZMlWAntOPtfwpRZMGHoiEYORnf/ZNz0QTzZpPZESW4Bpwlknu2e06eGBo0y1sBzlFx
	+SZ5nWndIGv8DFlcOfcTzsFVwLEnnsQFJbbaoOnl97aJ7V3Q9edYPcgkrceiZhjdYa2jCUZBtjP
	3GvvrKdL97yjaSeekSOw3Z9xmqJiTn2wnglyqHBRiIVT9NieJRoWX4AqAk6cO4RLIAp8Cb5/h0T
	UJM7b2gIoMYl53/jmt4cfiPVw7OncfouNlzQ5kIFOCHb1/Zr9TjKT00o5ppTIqRKZndfiNxSsOY
	PeMbGNYJVdedKk/zqIUFSZ9JckwAPSiTLok5+BkT2QuqS0S1fgA+q+er9eJNQmYNfD91uqySJW9
	AFJl31D1J2qhREsuWcjGO7ZL+udFpJvqjlI0c2WImX3L48+JYqbcDcWEyP9jWFTPookUJi0e3Pf
	2Zkl5kpBe/L+7qiqqlNV8DpP3KQ96yCILT3gIBo7iXJoBrgcCbnooBV/5l9k5M+TIuugJg==
X-Received: by 2002:a05:701b:2506:b0:176:a225:e364 with SMTP id a92af1059eb24-1b39febea9emr4982230c88.35.1794199999858;
        Sun, 08 Nov 2026 20:53:19 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3755e8838sm8409707c88.8.2026.11.08.20.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:53:19 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH] media: mgb4: cancel err_work on teardown to avoid use-after-free
Date: Mon,  9 Nov 2026 13:53:07 +0900
Message-ID: <20261109045307.1167784-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

The err IRQ handler (err_handler) schedules vindev->err_work
(signal_change), which dereferences vindev (vindev->mgbdev, vindev->vdev,
vindev->queue). mgb4_vin_free() disables and frees the err IRQ, so no new
err_work is scheduled, but it never cancels an err_work that was already
queued by the last interrupt before kfree(vindev). As err_work runs on
the system workqueue with no timing bound, it can execute after vindev is
freed, dereferencing freed memory -- a use-after-free.

Cancel err_work after the interrupts are freed (so it cannot be
re-queued) and before vindev is freed, mirroring the existing
cancel_work_sync(&vindev->dma_work) in stop_streaming().

Fixes: 0ab13674a9bd ("media: pci: mgb4: Added Digiteq Automotive MGB4 driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 drivers/media/pci/mgb4/mgb4_vin.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/mgb4/mgb4_vin.c b/drivers/media/pci/mgb4/mgb4_vin.c
index b247854..64b7a9b 100644
--- a/drivers/media/pci/mgb4/mgb4_vin.c
+++ b/drivers/media/pci/mgb4/mgb4_vin.c
@@ -1068,6 +1068,8 @@ void mgb4_vin_free(struct mgb4_vin_dev *vindev)
 	free_irq(vin_irq, vindev);
 	free_irq(err_irq, vindev);
 
+	cancel_work_sync(&vindev->err_work);
+
 	device_remove_groups(&vindev->vdev.dev, module_groups(vindev->mgbdev));
 
 	mgb4_i2c_free(&vindev->deser);
-- 
2.43.0

