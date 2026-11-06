Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793971978;
	b=GyVc8eB1+H4rbm1qvSkO4foLLv47R0up6xNQfgXyazglqoUtf23+qamA58XluepRtpRO
	 cmCEaUZNuk61w4xeoqMi/SraJ+Wo55x/Uad3ARC0Vv4pCCRtlAhr47aXJ5dJE/4N32NuJ
	 fH6eFZXnxtdspbpw73VQgM1gxvRYHDVUFu+sIF/IfOd23/bYHGQY0lBgXjcuR4K7UDwts
	 Jj+c/7AOdvZulxt+PMNUwryQwsGUrWhKHWkMxpG7DnYhoemNciwI1lQAgOX7WzwNvoVSs
	 eFBmjBs/Myi9haZ0EXAHnK8OOhLC3senWiRIWaqRgLRd2Iy2RHT+sFCeC3/r+9xRbVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Content-Type;
	bh=WPSfQ4DTiOqYcPNTrxF8uJe4ij6EkWMWaPQHreGW2LU=;
	b=hbiwDQ63TfItRQuZT5+Gx0BWtLjwHydxe6VvIZFWSvTlne9FaSLbbs2jVTaEgWQtHjyO
	 vbzkYEuLzAtMPRHng1T9GEc8rvB6JlNmJ5WqXegDFEuQoptGBgcYICaxt51zfNp8SMzYN
	 0qF98B5udKFRciHQtmTrCg/ULb3uVAWG4MesdcBkWIixovXrNao6jIGK9m7CNkUFC0l8c
	 kW82sD1ad2E6uB+OYB+FYe0b0Ef0Rcth4Bi7Cs379Ymh9wme7lFy7Jwkn6hgOpRkVBxop
	 30QpQ+6IUEf6s3QXZfoe/xFx5fg8luphhXLytitaaxnZ9g9HzTRpTEQ3UArziJ6Nrow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4kJIHeJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB3D606A326
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB3D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d4kJIHeJ
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b315dd057bso3608407b3.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:32:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793971977; cv=none;
        d=google.com; s=arc-20260327;
        b=Pa8IxvG3yQfvhRIvlgHJ2uA+1D/3F2LgzSb/SCdLxah9vtNUJXbNpb+bL2sVjBjD8f
         Hrxr5rAdM1hZ5n0dZ5qK2wfqk9QbC+Ez1+fUYH7ubdOGSYeco9atdycUkkCeB17Ps4hM
         pbeUj3bWdIsdqwHX07g28S06HOkIsSFv6NhlGlrY9ULCUU1x38qelXgU59uMO0MWzND1
         uC5niDCagpdOltm/yEHgls0Spr8pa85p2edyD3mLBY9b8aan3HeSICcbEZ0Y3WekpDWZ
         ZSQTchivCvLPcs7JD8Bs0qtTaNQqkV3Rp+ojewvr/3huhdUGSLSQIhNZQDUvyXuloFRz
         cJqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=WPSfQ4DTiOqYcPNTrxF8uJe4ij6EkWMWaPQHreGW2LU=;
        fh=RpYxnnRW5A5FvuL86z7f7YWfE0tvaTrs4Vecbev4fLA=;
        b=TUEy9n2CUToAK6Hp3RlhOTAQzHXnL3AuaoiFhcGzfB/kcpzkIJmSlt4uPIm8Yt/a4f
         RhYF6MQWdXxqaOnLA3CAkWzw6gPLktN0Cuh+6fNjrdYDvRZKJ/6aCcELd7J06b/2GB9E
         +Gtddg7U0byr8iDl49ZpYSJ+A8JBbDhWeViOiXOGoJ+HcyOzd5tQy1YCPsHcXBF8/ric
         WvrKH33oPYj21jIDNNwb/kJEqLmu06XwxqVHD8k5JDKc/dMLWq6wr9lYYVhLVLgsopaZ
         j27z4TXLZeP8a57wZn1pkZj93RAGGH4hm3QP5i1wA2Royo5IBINsqacpzmJLYC8KPi1l
         1BGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793971977; x=1794576777; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WPSfQ4DTiOqYcPNTrxF8uJe4ij6EkWMWaPQHreGW2LU=;
        b=d4kJIHeJ6v5csv/F8WqjJcKU2h1Voczsw36w/Lm2S5PGcP0PW4EAPmg+ma+cKW+8ed
         zDf5fDrN21UPTTnkucRht9n7yXGINDtC+8su5Iu7WdMwqeZdWCKDhK0eZb2hMWu8UqT6
         JHohWcjU2wWqUzKdVRKjDs6CPfHP6ACu72AzuTvMfYLMZD4z1cpiRusbifPNwTW+lLpR
         1tjplomekIXwYhLpPwoCrGh/stwIg1dm7ipacdQMnWYK5EitOMGJT7AmtJG0vTcb3Hrd
         9fiSzVLomXB3EOnvV0edBSqN6Omisz+Y6IF45KK4uU5kfIzOY2gFRFpwuwHFUi6wOUyo
         +1Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793971977; x=1794576777;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPSfQ4DTiOqYcPNTrxF8uJe4ij6EkWMWaPQHreGW2LU=;
        b=EQfWa02qs3w1ZNOSJGrYJ899bWHuXOtwwqBhzdXDVqxhUHMA2BjGtCvDx5Md/8TraY
         p6z5FF9INyaxfzUg58G/qWorFbDZXFSAL/kiclcsub6siiXkbJmjeS30zTeSGv4r5dy0
         neIvWgy2fzXuPYZvOx3Q5aaszjRE0/MyB0CERLufrcnfxcpwEET7xmc8cFtEXTnWVxjH
         4Hx/f11X/mxTYJ3w1DNaSJRUASpEUlme1SKsXqFQ+gBDnm2sWnNCJYDlklmUUPNIr2q/
         CQcQzJf/yDp/eu2xTb0H6Jj5aO0gHFeJs7CAcaSZV2YeWB7ujKzKrJbNHkyEYRk58cJ+
         EL2w==
X-Gm-Message-State: APuU4Z8UyBMz7wnqIkY1MNIrulcheuDSqnhrHR0CMjXvHyfnDlGQxfHb
	cjijxBlVHb+KShk4yWczFf7N5poESPZp5NGjnsIMiwww5mXGjiMRqWMJ3/cb1DPetW66YtZpoSQ
	SAW4LRf+D6sWzFsZTVVl+5h+h56LjY+TNXWmJ8HU8IQ==
X-Gm-Gg: AYBFou0ipqVUUkXjCgio93evEaJA1zyhWpKSVL73frjjWc9/u8FSpwWTnxsTy6tBJ23
	Hh9g7VUc8oOGpmYU1D5RMzdlwTxziam9ca3jusXUlUJSoEYBN0Au3dd167Uhyx9tAs9QGumRhmW
	VYRbWFIsb0T5TZUwzVoOnaPXoRUdYSGqZqKwZs4iWL5ZAY2KSIg1koxqYjpCIwYsL4ma61f8tva
	ogPCqLt6Njx4Uhlf1A2VRzUA3j12yxGTiSD8MryoEhSxaFZJBywQ0nqCzEJCage+AFxCZ6B59hb
	jzjt15lT6J2kwDGvfv75DU9WgbzRpTw5At6GT9LCVw2C5rUCSHV2MqUFNTPVUuV5xJagpp36/V6
	UHk9HRppTaVwdCpSxSxI2x3qAD9fiDhwR4orzQE9WCuHizOddIERAr+OdLgem
X-Received: by 2002:a05:690c:e254:10b0:8b1:6e61:513 with SMTP id
 00721157ae682-8b341599c99mr10146637b3.0.1793971977331; Fri, 06 Nov 2026
 05:32:57 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mehdi Fattahi <mah.fat@gmail.com>
Date: Fri, 6 Nov 2026 17:02:46 +0330
X-Gm-Features: AclHuK__YHk2iAYAkyyso0EupanDjDgtF67nzsEGa2yekz1mbqPha6sALzPqTCA
Message-ID: <CAEE1uDe8L-vA0Qhbd8=rd7K_2HSdntLHOowLVQ_T1es5u4zFvQ@mail.gmail.com>
Subject: [PATCH] dtv-scan-tables: dvb-t: update ir-Tehran mux list from live scan
To: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

Please update dvb-t/ir-Tehran in git://linuxtv.org/dtv-scan-tables.git.

The current file only lists 602 MHz and 650 MHz. A live DVB-T scan in
Tehran (Nov 2026, ONID 3622) found locks on six UHF muxes:

  482 MHz  - IRIB SD bundle (tsid 101)
  506 MHz  - NAMAYESH, OFOGH, TEHRAN HD, radios, ...
  530 MHz  - HD mux (TV1/2/3 HD, IRINN HD, ...)
  554 MHz  - PRESS TV, MOSTANAD HD, TAMASHA HD, ...
  602 MHz  - same services as 482 MHz (SFN / tsid 101)
  674 MHz  - IRIB UHD HDR

650 MHz did not lock and is removed. 482 MHz and 602 MHz both kept for
SFN coverage. Parameters follow the AUTO style used by dvb-t/ir-Kermanshah.

Verified with Tvheadend against a local tuner. Same change proposed to
the Tvheadend scan-tables fork:
  https://github.com/tvheadend/dtv-scan-tables/pull/177
  https://github.com/tvheadend/dtv-scan-tables/pull/178

Please apply the patch below (also as attachment if preferred).

Signed-off-by: Mehdi <mah.fat@gmail.com>

---
 dvb-t/ir-Tehran | 77 ++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed,
