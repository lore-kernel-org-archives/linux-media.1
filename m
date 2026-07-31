Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10518345EB1
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 03:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467677; cv=none; b=How90PkjqlQeLDdD3FQ5ilAvW52MYV1ZeXpF+zO5FrdmCm+UzCWKlBD6GNTnpkmr9VYae1vTQa/29XFoSmhugQBSDnm7h9GG6ocHLt9l5Eb+I5y+zDT+SuqHUU7neSBHAMfubg/b8wL3YcEUU77gb0uWWJMgAqaSrUrts2eqogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467677; c=relaxed/simple;
	bh=D7lV8pqcwSfjIQXU91QJw348K/1VhkgKB0CU8UNDcCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lGfOa4eTxeKF9pZ2hAXoS0mHqXyCZLahe2k5S6yV1MjaIzHku0EH8etuARmB9iqBXRppaA6UnIr14et5iy1XlaAaxkW7exzfRccLs6VBbEZaKf8mrY0CD4Mc6LZsiSgb0+SNxqFGt4l9kHr0Du2bfEetzYIsH32JPc2vp9NjGao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rPQqVQKW; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rPQqVQKW"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-81e69a2db34so8022477b3.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 20:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467675; x=1786072475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S7ZKiTADJbLAN/dBdlHmv4QidRgDBORO2OAbSEiJPls=;
        b=rPQqVQKW7MUXtW1vSb3A9xtNKO807Ibvj0HLwRBt6CdsQy09A1ocrPorkh4/Tv6Udo
         sU7IS4mO6culBzvEjy44aGbmmd5MBpQPYtLf0tYICPoGd/cKlgGg3FSLS70LlYXmMcyg
         hDkE/CnuQ7oiDvcletHOuq/lvkVGIPIHsXdVVhNs+zNInkwWmrBAthsUbGF0Qi7Vd8Fc
         zFMysctd1HhlcV7rWm6VCxZ+305QrdoURPCaGriSnRnPcW/K74OXz9jiAvN8nhNHsMVg
         6t+ASbMPEI8tQiKEdppvAst0QXTUe3K03A1O4Klr8B7As9LUZqWwFOQwEbZmry2i1j8s
         90PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467675; x=1786072475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S7ZKiTADJbLAN/dBdlHmv4QidRgDBORO2OAbSEiJPls=;
        b=fMpbo3GP3Qwpi3/q3peWEFfrbMqZs+wU9mnRIef1O1cTL9ekFZqemMJ7PuGysogHR5
         7Dr0Vzl9UBd4Yyb8zSZa+MVmYyEQN/IKIDRGQfcYQZkg3bZNbEb9mrrCvE6RCIv/bogf
         gRP0SRrJmNx6BHivKs/yD3pQiLmswndVgCZsZtWhp/Djc7FuWglcnNtNGeSay91bv3u+
         XyWlDLXdY7HTyJtI+EUclpEA7nIfvQDU0TxVgej+2LC6PlVmpPrFq35nqLtXzJi3H+tm
         IE78DX2wgRQP2CZE3q2daOSRxi2GdhqdYcNf1i3X24bTHVnJOn7bo6z+FA+nJUd33G8y
         hMsA==
X-Forwarded-Encrypted: i=1; AHgh+RrorzfBUJl7LCATZbDTYMr0EyJifRaQTgsNBoSLMLey4PRVWlF+wNMVPWpgZ96UGagX4H4JbM0F1k5bGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI0FhBLfvC30SqLKRoMy8+3NfofhcifIbr0c9ttRxg2QJ5c9HH
	PEtuEYYoZegGyeNcTNhP35JMurVR+VJUpt5bkpB8ni4y35/2kxNKnVAn
X-Gm-Gg: AR+sD12mw8GbDSUhgIDDMclVZ0zC9H9MD8EzKWAgvl+GZ+AxvRODqy30N1JA85jBytp
	Gy6aAYfeK4M3O5ykLZ3FicjtU14WWJnFAcUSk/RTJ8anyHalhQpHYDiAV/x4HPpkDQWUgALTLFG
	cOeF/2YvAr0gJ587Yo1dtGgyrd4yRmnxXpONrbQnvh/U0P376Pa2oH1shzT3WzvllBu28yyWswF
	Dks3ETtCqEYBcHlEotyZ0jMg4rPDjoKR813PXliUqHkcJjCdLPtXBNcFOwwzzKhHkS7QKw+maV2
	swu+CgTLsvAZpPzNY1umJhfcKgXJzECoiDuxbYXEW9JSVfTZhf8m4WQVj+2eH2Zb7xbHc0DylXZ
	Y/9wyQAI2Ak1qzYE2TqWkWorPmgZqlcjPNpcQY3DOGVbCTVNMuRtnuhttFx6LDPWqFPyVyoU77B
	pxTd8s61nYKxnWSfZrk+qaNxorAl7GR567oBA9N3cUKexVVf/uyZ7y2IJujnqz8CeWG7sKoA4SG
	EsIug==
X-Received: by 2002:a05:690c:9e:b0:81e:ac09:c89d with SMTP id 00721157ae682-81fcb9b6abbmr1464457b3.4.1785467675067;
        Thu, 30 Jul 2026 20:14:35 -0700 (PDT)
Received: from LAPTOP-83ECOPAB.localdomain ([136.55.173.105])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb88c4a62sm21519157b3.2.2026.07.30.20.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:14:34 -0700 (PDT)
From: "Cen Zhang (Microsoft)" <blbllhy@gmail.com>
To: mchehab+huawei@kernel.org
Cc: AutonomousCodeSecurity@microsoft.com,
	axboe@kernel.dk,
	blbllhy@gmail.com,
	hverkuil@kernel.org,
	kees@kernel.org,
	kys@microsoft.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	rongqianfeng@vivo.com,
	tgopinath@linux.microsoft.com
Subject: Re: [PATCH] media: dvb-core: add upper bound check in DMX_SET_BUFFER_SIZE ioctl
Date: Thu, 30 Jul 2026 23:14:34 -0400
Message-ID: <20260731031434.174630-1-blbllhy@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260729084431.30e0fee8@foz.lan>
References: <20260729084431.30e0fee8@foz.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mauro,

> Forgot to mention, but instead of returning -EINVAL, probably the best
> would be to setup the ringbuffer size to the maximum value, as
> otherwise this would break existing apps.

Thanks for pointing this out. I will revise this in v3.

> Having a limit is good, but why 64MB?
>
> Btw, what apps did you use to test it? Had you check what's the current
> limit on what apps?

I chose 64 MiB as a conservative upper bound based on a brief source
survey of DVB applications:

- The kernel DVR buffer defaults to approximately 1.84 MiB. In the
  upstream revisions I checked, TVheadend, MythTV and MuMuDVB do not
  actively call DMX_SET_BUFFER_SIZE and therefore retain this default:

https://github.com/torvalds/linux/blob/acb7500801e98639f6d8c2d796ed9f64cba83d3a/include/media/dmxdev.h#L189

- SATPI allows approximately 30 MiB:

https://github.com/Barracuda09/SATPI/blob/09df7402870b1dff2c7b2d7f4a085002a333045f/src/input/dvb/Frontend.cpp#L57

- DVBlast defaults to approximately 7.34 MiB:

https://github.com/videolan/dvblast/blob/ae6b24ae8cdf6eaa1ada8534a257258f3c906a77/dvb.c#L71

- dvbv5-zap uses approximately 5.88 MiB:

https://github.com/gjasny/v4l-utils/blob/95ad25f6a77a0a6650f5f657ac2c5046efcd04a0/utils/dvb/dvbv5-zap.c#L32

- minisatip defaults to approximately 5.51 MiB:

https://github.com/catalinii/minisatip/blob/d20136e23d47bd7f5de2967b34463f14bce6f988/src/adapter.h#L12

I have limited experience with DVB hardware and production workloads.
Do you have a recommended limit based on known hardware or application
requirements? I am happy to use the value you recommend in v3.

> Can you provide me more details about the test scenario: e.g. with
> what TV standards had you test it, and such.

The reproducer used the vidtv virtual DVB adapter
(dvb-vidtv-bridge) in a QEMU VM with approximately 3 GiB of RAM. The
root-only setup loaded the driver, made dvr0 accessible and set
oom_score_adj=-1000 for the process lineage to make the panic
deterministic. The ioctl itself was issued by an unprivileged process.

The test did not exercise a particular TV standard or transport stream,
since the failure occurs directly in the buffer-allocation ioctl path
before stream processing. I have not tested this on physical DVB
hardware.

I can share the reproducer package privately if that would be useful.

Best regards,
Cen
