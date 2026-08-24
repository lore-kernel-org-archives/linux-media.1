Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38887288C2D
	for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 12:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574849; cv=pass; b=EcVYU06beSx6WitBgI9wVsspg7VU1ZfU1CxZjs8AWZOlR9PRrpodSNa7bI+b3HKIEMEAkaBAwfo51KSi64q88aiJb0inUypA1aQ/mvSGNlk+Lr6uYmtMW+ehRy2OyfSS+tnaUXYObXbZG8F9XTPwIrZ+FgF8p+LxA9uI9j9j1r0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574849; c=relaxed/simple;
	bh=tskT+ZP9F4DGhzZmWZFu+9eOA4lqekEJvBP1dR5VYdg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WQcKE/o35vLkT69h3WJ/3HhBJhRoLH9H2ZQaPqzo9cULlF3fxpXqo+GKg6TSTje8hyBfI9lcH/U13VpF+6Rcd4gQ5SLZQzO4CH63U2J/gUp2Dd2FQyajAp7hkAnqtkpbuTyMZZ3XlGaNXCo2d672KJTxooqZQ+F2u2a7ao0rc2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com; spf=none smtp.mailfrom=stromback.com; dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b=WM3sKtDW; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stromback.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stromback.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stromback-com.20251104.gappssmtp.com header.i=@stromback-com.20251104.gappssmtp.com header.b="WM3sKtDW"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c70f69d3fso3645701d50.1
        for <linux-media@vger.kernel.org>; Mon, 24 Aug 2026 05:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787574845; cv=none;
        d=google.com; s=arc-20260327;
        b=OnEM8emJgsZfvpewmheND3C2opO90vnde3F8q6fKuyi+oh/CedV6dRB64KPFgTAVFd
         bsYmLL/VI8/KhpQhkBLKjXJyKVc4D+TRq6CSh6KRQtdkZh9hwkDMGqxaG6DMbAk3kpae
         Fu5AnV01j9Evu2Uj2Jm4zPZc4caXvLze6IrcFnx4roJBfa3LuXzC9asC66jd/jPgb4xo
         ufJlSKY4G5q92k8bLVnB1Yawv0MH8Du2C9I0bzl+/2qV8bL1W4XPjEFcTnvRTyDyz0a1
         ulS/CZK4ACWIPBznFtdtg7xFa97U7iO1jiAtvLCwZRc4ZpkxlRGYUSmywadR+9q1nOzM
         E7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=jqeK0Jxd2AMplwAkH2EQeU2YIUtMSat/iw/5as7CV3s=;
        fh=hx0CgVrXqndxux1WMwMI3FTNXFa++Xiwid3I+SC97So=;
        b=m8YWztsoSsnD6ulmDRfTcYmlGZcEhK+4rqw0QvTIcOdpPvrxmhjtU6R4K5cR+3xhT9
         f3/xeGvTGFShkWE/p0rePGlMXASZs4P2OoKQEQgINvPVTRDBnJOWTI0MCfGxkV7XSDcB
         FRr51q0jZaor1NKqmVK07D5k74x6ANuaZDDEAbcgHkFUzhaReyAs0zcUyfcpVYzoHZK5
         2SfwZLb54qwoXULC6HAFDKFR8DZHtOA56i9yv2yUsM6Ns+Mhz3p3vqt1ctNKc0UH7uye
         NGBCnTJbtMA+IPR5Gbbx9lzc/FeyOg66B/fPw7VFsyxzdJj7vBnTPGZpPmQTGN7l8fUI
         iyQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stromback-com.20251104.gappssmtp.com; s=20251104; t=1787574845; x=1788179645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jqeK0Jxd2AMplwAkH2EQeU2YIUtMSat/iw/5as7CV3s=;
        b=WM3sKtDWWKe5+ppP1acFOCmU3M7ZL3s5iaIxSK+7UDt2SkrYoMP4Vy0nKBnZ9r8aDP
         8AVASgfdnZ/X+nZb/+Ho8TDMj6CcAgokuP8mNv7sBJQ5Uhgk3xBH/Qxb5rOA1RqEfXkk
         0ngP+FIhWG62fY0jv5XOcqBhkvidR5Cg2Z44W3ul2yPFnfRNQZHW9Sc1Tj1t27TgEY5H
         13E03xIVLJIZo90x0eKCBzWjxnkgrrAFqZjsX3xwmQgHhrKrOfN+63n4Uu9z9DYaZGFu
         bzwZx8ozgSUyOYnxCV3K+eiZuw50CCh+nyS7Tg7vROtOmgIQCqwx1AdUk5KVsu3/x7/M
         cF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574845; x=1788179645;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jqeK0Jxd2AMplwAkH2EQeU2YIUtMSat/iw/5as7CV3s=;
        b=kCNuLCCbd8I5KNY7HlRMM4XmZ2aRnWayuS7YR+0HCAwleEqFkbbCXn4A2v6tcdGNEJ
         DFTQEMIiSSNU1TK/02Cf5wmF2Re2q2b4UwlEKV4xN9ttoloTHvKHPEDSJXcXARt4r4i0
         W8t/3h7Y4ryDOvP2R6tcRoO6EcC2UQewN3/kftTYTbEhpvBc2F3XmaSild5TR9ivA2ck
         rrI0NvyGCXJq3qdA7zV65LujMq0w5PtnELSMibebbe72xuBIO6cVT2maGP2Y/G4ZpkD3
         YKSKf3PQ1R8McNVsxR1AbGKOxp2RtFrv7kzQ2RllcIUBI8e7HDtqlkblrfM4EmTSgFRd
         vwoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBQpJ6XrbpyGdqMxvlnZiA3/pLtpj2WK7wccYImBPpt82gwFuxxHh1BsFL1mfiOoFRO2cfccTt15Arew==@vger.kernel.org
X-Gm-Message-State: AFuF++lWgGiXrBT7tvO+pAXIP7GKbMyRCNVofr7g44MWdBipuE/9RV5U
	4DqAwspX64LXCmNwRJuI9YZnl9d9+rAl36etZ2FP6Cvtv65mH7p8n+SEq9jBoF8JOuST1cU3VrP
	kgalzgqBgA3uXaXASVaki9yZBDHxo5R01Gu65dVYBow==
X-Gm-Gg: AR+sD1065f1zJhRqPRW12ihFApCaBtrh5IEsh2qIp0Px7pi+IbNTK+LO+hTjIsL3xdI
	u0BDu5rx4xQM5MMk1TG6sYM1rX2aZ0NN7M/zkOmgz/ulSgdu8/2b07Xf5oZTdf36TqscFnZ+ppo
	Dc8tyu1zwoQeZTy5ZpT56u9f1zCFUSgJ20LOOVh14RGxSWM26k+NbAEYN4rj+zo7m2vRo1cSUKe
	cWlxBIEmtB24x9DBFvXY7lZBw84QglC95glHAV9agisKIGLElqgP9BZ28eEo+S+qajEjYW4wNAI
	ySs9EbX0x9g6IjqnKh/GL0AKj0MIZ0zgQA0vJdSIQWgcHsloz8PVDgoyZ4OCO0MI1PZe58mhHeI
	yLNuiwJinx4ALLMJvPCeCTAFFqLftYDvkSSLp9i83Vf5OfoTT5qfg1IMfXdFI8sbL7kIVV7s777
	bTktlwBubivOPbvKgXgrDosBN0FnWwCfeVkAm7AJDRbJGm8M0Jg9ewdI6g+qpbAb/RBf4zedRNJ
	LbqFF/flCVhCJnzZ6b1YTsahitNEQs1bQG7tMX9BtA8lBqAmHao
X-Received: by 2002:a05:690e:4889:10b0:66c:f151:4748 with SMTP id
 956f58d0204a3-66cf1514b13mr3961134d50.34.1787574844867; Mon, 24 Aug 2026
 05:34:04 -0700 (PDT)
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 05:34:03 -0700
Received: from 313336824172 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Aug 2026 05:34:03 -0700
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAEth8oHoAyuCwHXVJNo3Z=JQB63fJ+LtnNsYFrwtnkjTu-CPkA@mail.gmail.com>
References: <CAEth8oHoAyuCwHXVJNo3Z=JQB63fJ+LtnNsYFrwtnkjTu-CPkA@mail.gmail.com>
From: John Cronin <john@stromback.com>
Date: Mon, 24 Aug 2026 05:34:03 -0700
X-Gm-Features: AcwNN1XSCx1Zhsv_edTT1gPD_cfe1fD0OBrn--dRWbyCS3KJLXmcXP620vlCNuk
Message-ID: <CALr1FG-K_Zade01g33UquDh-d_ZDMej3QsPXG3-8eiB_GNW2nQ@mail.gmail.com>
Subject: Re: [PATCH v4] media: i2c: imx471: return 0 from get_selection after
 filling crop
To: hpa@redhat.com, linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com, hansg@kernel.org, john.cronin@opcenter.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kate,

Thanks. v5 drops the extra braces, moves the crop/bin locals to the
top of set_pad_format (sorted by line length), wraps to 80 columns,
and keeps only the bug/feature in the commit log.

checkpatch.pl --strict --max-line-length=3D80 is clean on v5.

Yes =E2=80=94 v2 through v5 were sent with git send-email (SMTP via Gmail).
Gmail rewrote From to john@stromback.com, which is why v4/v5 have both
Signed-off-by lines.

  [PATCH v5] media: i2c: imx471: return 0 from get_selection after filling =
crop
  Message-ID: <20260824123348.3761049-1-john.cronin@opcenter.com>

John
