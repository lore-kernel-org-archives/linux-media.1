Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB1438F92B
	for <linux-media@vger.kernel.org>; Tue, 10 Mar 2026 02:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773111504; cv=none; b=XBHP02zgybAvcADenPTf868UwcStdtxT/pGtUbQ4o0+R1bFfShCaxD8cUUK1lUyY2tGmQYQdCAyZxIe8B0fABTbkkNTrUIF6j5kcniYd2tDo2ynqit/cnf/ynQ9MKdCdsGuuvDWlu/GUAxIMDpHA2FDJRBl2EbK2jQb/YNWO8Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773111504; c=relaxed/simple;
	bh=QbTazj95ET0BF1bU1Ga6nRj7EK+gkbXo0adXS1pdkKo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qKATZ8BVAKCSOOAsv+y92EB+7OQnSLA4X6wxG781HZQ/uN1OyVaJF9ZUKtYqePzVJrK0i4CjMmIv14nh9UTZHExfybnIkY8ceN1A0cgrOf49W1qcdN4Fm+gfYZ6JK/P2aISoet7ppwZeQ7o+sz1Pxs3cqUyEar2lMgXY4pMbxO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjEoQqTu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjEoQqTu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c70ea5e9e9dso4639674a12.1
        for <linux-media@vger.kernel.org>; Mon, 09 Mar 2026 19:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773111502; x=1773716302; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QbTazj95ET0BF1bU1Ga6nRj7EK+gkbXo0adXS1pdkKo=;
        b=SjEoQqTu+rYmi1ivXVn8YMKt2k8OSnrCDVSsSAmmt81jvfG0kzqfXURgQC1xlvTpk1
         Ch2o8u+gCp/fNPMb+KM6iuFV+CNpXDx++q7mgY9Z+hg92kjLPWwkjkOfF7og3xUx1fqS
         ew+gP7TCRiliDJgF2ebVY1S/svC0No5umpJLEKXHX1DVdpYs5Hxu5HU30Yq+NOTjv4+R
         mw1h6N16K8pryHvWlQpoFSvDcwd/DBCTTZpJkBA1Z15pl1m4x0yrXxctG515d51xFRzG
         ZODcnNTNqeOsHiF4XhjySntquD5WG/F6nurjtT6eUzcM9omJmWCMHai3ibmnE6AVV5Fl
         ByEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773111502; x=1773716302;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QbTazj95ET0BF1bU1Ga6nRj7EK+gkbXo0adXS1pdkKo=;
        b=M3RS3ODRj4fPI6oj0AY/BB2uGJMQMBprLjNNIFf/bCqzBnkQmcpNoTsSLvRfkgjGir
         kWOR+CQOvpEuD7uqgOMH0V9P7d9Q4O2XEGZv3ewQnAta+rBhAnI4O1EfASP/ifjbua+B
         tau101A2J7vvrOYy2+nnyTeDekEWSxIQ7y5Ltm/1OhDdJb3RLqazLTje/9pSQ6er2u/L
         Xc6c9HV3NCXmstLh+GUGX11liUyer8McIYkKYUBk0fc04wfcNw0Xd57nd+YvhSedgcLS
         ggmlAOnoM7nMNmsSOtTkoF8zWJampxRhLpgRVW0SSWkV+jbtNJRpZ+Mz87XpNw9+pZ+Q
         L0Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWoiIFm62EEKYvyFhCzSV/T3NxB9ChcuTqsop30+BSphbp2f7NleoUUQviUsKMQZiSNRGBGbSjzRiV/Xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0l/zAkXSpNSi7nR4X/HaJHEKWBeLCI0f3NdMuBZKUTEt29QYB
	ZkjIkhMOm9cy3SDgcdxXnvyR/cqIVtYPRUu8M6IRgI3K/9tcpnIb/K1f
X-Gm-Gg: ATEYQzyzeP3awZ+vL9ZCDU0SUg9HsJ29x/9KSjI7yfzlowmpkx+KLTlnPERPvhjSzvn
	j9WTVp5WELW86F04LNlxFtcnOYxbQ1XGrmfJd4AFntx/17IzPs5X0g0CesQd97YygJwWp0nWQ6E
	AbbdsE0BggEMK+yoZ5mvKBMf3OCcRryTAR6Zb7W8L3Nr2CZi83yf4DfyfWIQgQIuez3YZnt8qR0
	gV+La2lqdvG62qoji/8qfSYETk2dLN7EvlASd4VAtHRkKNOCcxoIJ/SUOqZQJWrsWgVlsMg5Xe5
	Hgdv7F0Z6bzD/rouLWpuYBbheZIcCn9eyrgiY5pngo2juYgvUIe67tPBVM9r4x1cMKIrqYKevNk
	HFUM7zB84pThxjqhgVKro7dyw/xtoY8xneh8H0lJCvu8wJDIp1hqHl94qClkXbKTqDFXwr20R5r
	rd3l6qhElYidkDmPjulGtAtaiUJjTYDQaQGg==
X-Received: by 2002:a17:903:1a24:b0:2ae:4ef4:1415 with SMTP id d9443c01a7336-2ae8238544emr125594555ad.13.1773111502419;
        Mon, 09 Mar 2026 19:58:22 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2401:4900:53d0:5b96::e3a:5d35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f75b15sm178533205ad.52.2026.03.09.19.58.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 19:58:22 -0700 (PDT)
Date: Tue, 10 Mar 2026 08:28:17 +0530
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
To: Marc Kleine-Budde <mkl@blackshift.org>
CC: mirela.rabulea@nxp.com, mchehab@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, linux-kernel@vger.kernel.org, kernel@pengutronix.de,
 skhan@linuxfoundation.org, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_media=3A_imx-jpeg=3A_con?=
 =?US-ASCII?Q?vert_kzalloc=5Fobj=28=29_to_devm=5Fkzalloc=28=29?=
User-Agent: Thunderbird for Android
In-Reply-To: <20260309-excellent-lionfish-of-symmetry-5c1a77-mkl@blackshift.org>
References: <20260308060554.1764128-1-sanjayembedded@gmail.com> <20260309-excellent-lionfish-of-symmetry-5c1a77-mkl@blackshift.org>
Message-ID: <6E937F17-2248-4E9C-B2C9-A28FED599703@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9 March 2026 9:23:57=E2=80=AFpm IST, Marc Kleine-Budde <mkl@blackshift=
=2Eorg> wrote:
>On 08=2E03=2E2026 11:35:54, Sanjay Chitroda wrote:
>> From: Sanjay Chitroda <sanjayembeddedse@gmail=2Ecom>
>>
>> The driver allcoates memory using kzalloc_obj() and frees it in the rel=
ase
>> path=2E since the allocated memory is tied to the lifetime of the devic=
e,
>> devm_kzalloc() can be used instead=2E
>
>What happens if you issue multiple open()/close() cycles per device
>lifetime? Will the memory pile up, until the mxc_jpeg_remove() function
>is called?

You are correct=2E

Since the context structure is allocated in =2Eopen() and released in
=2Erelease(), its lifetime is tied to the file handle rather than the
device=2E

Using devm_kzalloc() would defer freeing the memory until device
removal, which could cause memory accumulation across multiple
open()/close() cycles=2E

I'll drop this change=2E

>
>> Using device-managed allocation simplifies the error handling paths and
>> remove the need for manual cleanup=2E
>>
>> No functional change intended=2E
>
>Marc
>
