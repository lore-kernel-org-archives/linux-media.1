Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792446999;
	b=IJYGo5TIMmtQckxEUsqa4vdn7Dv3LSMAjOTtpxnzLi5rPPPgK5jVTTG0ekmeBowrBr8Z
	 I2ZSY3p4t2UVyVDB5oW1pK2j1XryDqOsv5cB00GOq36XMmKtLmyJuKeunTy+AjeEDO4nC
	 QBEgxfFcI+w19CpGGrycbPuH/AMQQyBZZJjDzU5kVutXlXZCxfpv7Vdw7JtFnsykhEAAj
	 4sJ4P5uSqyJLOXt+RnFV7559PgOr5gsjqOZZTvXCSIEy6QItvEtsDcm+ZrgfFtWBMbIQ6
	 698P2eCVFI5SwqSoOxnvuIPVncJFSkpCFQ81NADYflpghlZD5RMKcN5G4uZwAK/yPFw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792446999;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:From:MIME-Version:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type;
	bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
	b=H7+FDhiffT7j95GWTU7EJIPF6WNvbL/A/F91m3OGivOLFp3OXUhIaOPM2KOskJCq2EiB
	 t5IPQk9qhexRd+RAXfWznjeEj6AIpceY8Vyyku0OoK4eaxtYxDM67vXWSk7hlptiqMYJg
	 VFqt4PKORi0HNKOe8BJO6TUuGvmsfEyAfTPAbEMauLUS+7hHfPE7KYJ0rC+s279LHfyY1
	 g3wxZwtaCtwBgmgCGrhTVow0uSMphXRHs4D+ULXCfYgbFHA4Ex2+iL/A0R8Er1ZphOW4X
	 +WmC4yutaqQ8iqkeKlcap9yuhCKZmArmiT2XZKJnkIzc8jSyGNzq4//CPuTfs9yzqew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=carboniste.com;
	spf=pass smtp.mailfrom=carboniste.com;
	dkim=pass header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b="ZaSnfP1/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEC3606A319
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 21:56:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DEC3606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=carboniste.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=carboniste.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=carboniste.com header.i=@carboniste.com header.a=rsa-sha256 header.s=google header.b=ZaSnfP1/
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66d176f0569so184511d50.3
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 14:56:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792446997; cv=none;
        d=google.com; s=arc-20260327;
        b=Iio5uWlqHBiyywmppwkTUJHfLqj6MnOKAluBRthtz/R/W9Kc2Vlkv2kzdI2jZ9fB4T
         RsZqOiNEPW09i1xHTYDsCFfhSJ3w8XdYNkGmvDT5Uc88FkzysLxD53Z94EW6Nu+5uTf8
         yVdDFtOkJoFXZZOfYHaQgTXSW8cDFKvQCDbRpVy29nCXkG5JmTDQzByhWTA71yuTjmH0
         LqqrnnFa7Dr5cobjiUlpkM4QZe5+qsAJ57x4WOQVzCoCCNwB9yDZ2ke3SJoAqvf2Y6ye
         eYdH8CmViXUf+B4fooTJAtfZEebQA01CckPz4isLkrfS6PS9og1hQ3W0DC38JzvmEFCK
         qrsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
        fh=rFIHJTeJz4qzGJfLr5OYwkS+HHd8sIqsV0YCIiEZb9A=;
        b=Cvk6UWPW6NAdZWWJ7KKLC5Y7uMFYb4pD4krY0K/3B94UmkQUNo7Q9KylM+dPK9/q2R
         4+pPBBJukgUuGbjONi0+mlDz/LQe8d5jqLNf5ElJUPI9L7L4zKwCHx7/Lc6kM1qIE7Dc
         bvqKg6K1pNv3wusWAbvi8KDIZMJVdK0mg2HXHER9q3QqSZg8Fu3NMcnzuCCkAEVK0fD6
         H/YaUh58T8Bf1d+coIPAIprdteOt8g/dIl+ajm2GsONN3WOsl5izKNOk+GDLBW0DwVxM
         dvpRrXwMV+6+/3TxIUj+rTdd0OYWm4CNZdhfyezGSP06a9YGq+CRs32/d+Crwu9Fd28G
         QXug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=carboniste.com; s=google; t=1792446997; x=1793051797; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
        b=ZaSnfP1/XHLHAiaalCKV84qqlgMmBr7/NttxXl65fwlraARdlh4VxwOhHvsR0cgLr9
         aVkmpPjL1a8kWfQLx5OOy0/2Qg8YceX5fv5k08Msc3bnOW4pkamaJi/q+MMaLAkuZK7u
         knO/ysdviB6rtDfLAmAB4pxnSwd+1sORi2oIBcHgGp0haa8E73ejKEUw6hm5Y855b2ZE
         q8RR0hZCHexD0aTxqfBy2eJ17ytII97m7zx9LrNuKUnQx+e6XrB5/xe1FavhFulTEW1g
         O9YlTFxyqLiVg+UohQH1fJJPvqUSCfKMfjpjkNP5p6wsOKRC3DRxs8AxwBksmH35FUzL
         ItaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792446997; x=1793051797;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OlTsbQmes6AWsUL2KZGs9778wykZw2L1LaR91qckPc4=;
        b=mMJbLhGtYkxmbuBxoZidae3zLw0ykhOC7kf+8hScwuzVF8zQ1Mp9aYUfj3rj0/8m2z
         bKnNpofzMsSO2ias01RtNtt2fo682YbjO+9yQBBvwgr8clp7XWasW8c2TCdmiR85LpUK
         WV4PwfXjT1DNpfYMPBJ/7U+GcLxTDWYinD+4ZHxdmKE79f6wNHq0QOMyb1Wj6wEJRz5e
         7bdHPACMT290oKVSV6tqAOYY+Qmys7piDlJ0Y345pVrAvT7YVPxSQ6T5b830CXYALEsT
         zGcXFWgMqzFKFzHHS6Z8pgsy9+K3WF5ru36CwuuaTwGTMBAI4nB/ir96naCSBcDxr6xw
         fdIw==
X-Forwarded-Encrypted: i=1; AKwUvBzUVpL7rImE8ei64lcNrjBlZvsGNNh1xArsRFqlb6i6BtNztnlkun9UbKvjYvGmbt6slZFoGzIsnKvcjg==@vger.kernel.org
X-Gm-Message-State: AFq9FYImVav66ddJzpXFYytWTax+U+ZW7F4TqQukn0w2IiobzCbbdojA
	iTcDeA6vEgpcDFGEPEByGTjGGm7JKlPk8AS3wGpB7mz1aIbXgCUHIxWMBw9j0/3DDB4se9h3WY7
	tWTdftwpIhWrOgOIYMcX+5vvnX2t2lNgI7CQIDyjEYi4=
X-Gm-Gg: AYBFou1DS9sj9AiHoCdbXrDIN6Bcg43/8Wd0vS1FvzHn70Y6Ri3deSXD4xxWKtzmObq
	d7eU5W/xacJI08yTtG5rGtwJL5F8vUXWdcCBID+UfLiCkWlaVFtPHKbFZMXlHlVYk7Kl9jQwclh
	Sxo75mgZIRbcIhhJ4ZnYoHYUOkiH8OyRsAQ5mOFUq0suJZH7UcYLt6qzK1njoCpfWSYnY4t+BAz
	5/GfwPUt6+3coUfBDqz7JZx0gy0FKXFNGzOhx+kdNjSE8oq81OHrZwKF6leWFxGdrVV0KaEV43Z
	rdy1zStFxr1i9GB2KRhMRCfCjC2eK2v68InK7Hd7U/bR+/Yb0J/ZC34b
X-Received: by 2002:a05:690c:78a:b0:8b0:d4bb:d82e with SMTP id
 00721157ae682-8b0f201cea5mr54319837b3.1.1792446997027; Mon, 19 Oct 2026
 14:56:37 -0700 (PDT)
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:35 -0500
Received: from 658150881093 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 16:56:35 -0500
From: Dan Person <it@carboniste.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Mon, 19 Oct 2026 16:56:35 -0500
X-Gm-Features: AclHuK8eyO7HlcwKc2GYb3AqN5ZWr3BuIJrKjRd-TDIzTJsdA70_Da8TUaFuekI
Message-ID: <CABZx5Lu3ShYsPtEsKFfL+Ch6G6KywH9eZ8e=YDYgJqu-k33kJw@mail.gmail.com>
Subject: [PATCH 0/2] media: ipu6: make 1-lane sensors on MCD PHY port B stream
 (ThinkPad X1 Carbon Gen 11 IR camera)
To: Sakari Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc: Tianshu Qiu <tian.shu.qiu@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The IR camera of the Lenovo ThinkPad X1 Carbon Gen 11 (OmniVision OV9234,
ACPI OVTI9234, one CSI-2 lane on driver port 0) has never produced a frame
on Linux: the sensor streams, the ISYS firmware acknowledges open and start,
the PHY reports ready, the CSI-2 error status stays clear, and every
capture times out.

I traced the sensor's I2C traffic on Windows and Linux (the initialisation
writes are identical), then compared the MCD PHY register tables in
ipu6-isys-mcd-phy.c with the tables embedded in the Windows IPU6 driver.
The Windows driver has no 1-lane table for PHY port B; it programs a
1-lane sensor there with the 2-lane port B set. Doing the same in Linux
makes the sensor stream Y10 644x364 at 30 fps, alongside the 2-lane OV2740
on the other port. The current 1-lane port B table also contains one value
(0x5d060100 in register 0xaa8) that appears in no Windows table; it may be
a transcription error, but I have only tested replacing the whole table.

Patch 1 makes that change and removes the now-unused table. Patch 2 adds
the OV9234 to ipu-bridge. The sensor driver itself is not part of this
series: its mode tables were recovered from the vendor driver, so it is
published out of tree for now at
https://github.com/carboniste-it/ipu6-ir-face for anyone who wants to
write a proper upstream driver. Patch 2 can wait for that if preferred.

Tested on Ubuntu 24.04 HWE kernels 6.14 and 7.0.

Dan Person (2):
  media: ipu6: isys: use the port B 2-lane PHY settings for 1-lane
    sensors
  media: ipu-bridge: Add OmniVision OV9234

 drivers/media/pci/intel/ipu-bridge.c          |  2 ++
 .../media/pci/intel/ipu6/ipu6-isys-mcd-phy.c  | 31 ++++---------------
 2 files changed, 8 insertions(+), 25 deletions(-)

-- 
2.53.0
