Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727535;
	b=IaKUAflR4fpyjDsNoPCrYzzplRfUl63FPwVT9TWsDkjPo5VHBsxP+hzTXBYlJs/yNAFX
	 Gkh1L38zBVgL1xL/OApWRWyjnUapQvIRvidKGFE+orAbl1LY3Hbr4ffmx5xCo9E4o2iz7
	 qTp0UDk2yN9vt/6V+L3gfl2iYOBOfeF21p8lcPNVM4Vj4m/qO210qgLkJu2zqUESTAfra
	 KUPmmnCX6u5QalgrlTp4DqdMBkeK+5KjkD7qqBHvNGW2b7BwCKgg1UBOdOsFYAuXAYbLJ
	 lMjwPRp+qkGeOoygR7/Ft0mhYEzP7nN2i2v6CNtWpG96qw1Prf0ROn9mKaEjysGWZcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727535;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OkwjQcrA+9UHu8UElL0k3VjIuq9juyNW3QXudrampI4=;
	b=zmDelGb8I5oCwXAyvqXA+8aEuZUegNs9mKhPcizrwyY1HADds04sLaqxBgFLeChtXjum
	 Wal3E76zLjXMqZnThEqpdkYnnxOItJ/eIf0oBj2FvwbPoDyhAiWsH2vzcFk1biM/8YU6C
	 N3jxyFeMGulDDKIB+qVh7QcjHtComF3UTAf/iyE7kjQK66SRoYJ2i9QXwC8vjTc7iB06f
	 kiKJmZ2PtdhVlLKrhVoNBeKqEOIKykMJOgZ76f/EJzM9g9Zl52EsEpIoQIys9XdrrQ4K0
	 R4I0mD2j1cmFd2VI0gxchPgzhyusc2eh6Psmopnqwo3Rto6q2KNMA9NpH1gUvPe0tRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D2F606A324
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 17:38:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D2F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso44862615e9.3
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 09:38:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793727533; x=1794332333;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkwjQcrA+9UHu8UElL0k3VjIuq9juyNW3QXudrampI4=;
        b=TGU774FG/ZJB5kMefw8GJRQpGrZRukzBVOGIxshn0VO7bHK2j9a9KBqmsPlFnvLJz/
         oN+DYtaSaE5EmY6EiUsfDTpBjHYjHmzGQ+Tjc9b5ZaPnoWlzCQ1p5WZS0iniOvI7dWUa
         D0tlsDD9QJG9adho+JhxUNn9civzFmHRKoozKxVScAqyKn2qrtkhXMX0OH22YYv2JOh8
         1jnrZciM8kLx2wbMRB32owLqUlsZ2b6tqOvI4OXNigpwi1TCxNx4lO1TxwjHl+kl+TJY
         fm/c/bFlcpjGZwQAiB/xblikiWFjvMOccZfjOaPJPyfDVX4640ihllf36Zxz9DCaaSuC
         whHA==
X-Forwarded-Encrypted: i=1; AKwUvBzrJDEF7Bc/SWEjVM+H43i/x4XeCFurmlrUNm+zw+ekqlNJ0ABa1nj2Ggi0xEavoIECkz84VUlgIb9ZNA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/cnge2YNnloloaalB76pl0PJp7UdmU60XAye4FAC+rXPZMr9P5
	BT5fflPgKtJKXbHmKBvrKN+QZR6UHaSDbjNxNn/MtlChf/coL+Y53DE=
X-Gm-Gg: AYBFou0pXwmEiGYOpXHsSY9uceMf0Gr1rytYrjIp84p5h4xBuC1cWB1caoAYAV/2drG
	X1doNQRk0BTxS5h77/azxZA8pAhJk1eHfqWagCM8Y82FR4Jlvg8sXEH8Jnzu5EmSoz09ZvwhwIv
	d62WtRvZgRu8krlanLXIswPIEvM+JG7qIPzm6fkNPYiHP9/+u2umGaC4qZiPPi6udOOEV8Wzzb+
	0w2ahp2zrOuy3oIVXeYUqmgFkWxQL/EBLdAYpgI6quQ0oJF72NSyeTldrhZVtVlur5GjleYuV7O
	l0GH8CGLBo1XanW577tt8IIofH0thwDPz7pTuhuvYFXAZ08K6vAb20XuNnLNvA4Eb6dFNRdWCXD
	xJmuDP+vpVFnHBpkqjQ545DstSy7LNT9TkERZlvIpirLH3fI0NFXWzY4YCUWVEPCtHS3w/OdJP5
	VN2Xj9HJCXZUN6xtL2457T2ODIlohhenXI6QGDvFek6Jq3Lr8nrcFqNR4DUsS4cmpZCBuaHEGX/
	9X8nxlXzNUETSVIuk46Gy+cd2KG91cFrBIq1eL/RsOdOCL/+XbkPNNtiHBQJrb2w7GqzBZemSC9
	pxy4ogiueVrhY4zHplGI2USmR0UbSGlJtcBVLFU=
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr328285605e9.22.1793727533176;
        Tue, 03 Nov 2026 09:38:53 -0800 (PST)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ad414e298bsm173637775e9.2.2026.11.03.09.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 09:38:52 -0800 (PST)
Message-ID: <6aea1c2c.950cae81.3a8700.c477@mx.google.com>
Date: Tue, 03 Nov 2026 09:38:52 -0800 (PST)
From: D. Manresa <dmanresa@gmail.com>
To: sakari.ailus@linux.intel.com, hansg@kernel.org
Cc: dan.scally@ideasonboard.com, mchehab@kernel.org, brgl@kernel.org,
 toorandom@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse
 the software nodes on rebind
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Please drop 2/2. Bart's driver core fix [1] removes the imbalance that
2/2 compensates for, so on top of it 2/2 leaks a reference instead of
saving one. 1/2 is independent of that and still stands on its own.

For whoever picks this up later: the rebind failure 2/2 was aimed at is
still there with [1] applied. ipu_bridge_init() only unregisters its
IPU HID node on its error path, and ipu6_pci_remove() does not tear the
bridge down, so a PCI remove/rescan leaves the node registered and the
next probe fails -EEXIST. Measured on a Surface Pro 7+ on 7.3 + [1].

The machine that produced the IPU6 numbers in this thread leaves my
hands at the end of the year and I have no other IPU6, so please do
not wait on me for retests.

[1] https://lore.kernel.org/all/20261023-swnode-dev-notify-balance-v2-0-948d9=
20a79f6@oss.qualcomm.com/
