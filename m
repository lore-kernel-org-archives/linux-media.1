Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC93137F732
	for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791989477; cv=none; b=HiP1zc0Tj4GePbo0Ghiy5ehkKepXk6xUmIbbm9jy5gnLCojFhxuXmsFkBfzg74jfEOIzVaMK31so8zZwiRbsc6YM9YPwLSF+DshE1XEtCY3Uyt8V/2eMFKI4ua/1mD2i4xPUy7Xw77XDMlR+jOvbT2S8i4NhfQgJN+Y6BuNrQs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791989477; c=relaxed/simple;
	bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=e+HPjz3TdWxlwlQHBcFSA3vAMGINwe6wZHO+qCxYlHy84oj0CLaqSvgerYWNTd1CA8C/uXI60zNa7QJWSw5MT5NYXDKctqKRzaALOagqgB7diGIzplWqLxX4dfnwpvzINRtocZJCEm2V8DekJ5g+PqkOIP+strJ+2xP/1CjeCdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KJlTsPQn; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--johnsingleton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KJlTsPQn"
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a41f46d629so789932b6e.3
        for <linux-media@vger.kernel.org>; Wed, 14 Oct 2026 07:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791989474; x=1792594274; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
        b=KJlTsPQneOdTf+NTnEos2i1mBGw3NT6yl1s6xGRchVxV2aqPUvUmXNzpMG02tz4GpY
         bc8jA0xajctuztG1P6Ca+wtFW1m62LNLTBPkvKz9MWWEPTKyrTU6NU7sYZi5FO4oVrgj
         7FQ5RA6fWyovx012HSl8I9iFXnM71GSyWaYwOq030UDqN9H8j9LtPa0VnU653FEsvltW
         LjqikJ1IeMTRkGwJ3Wnb0i3U7ex4UnUCToSNSXGU04UBcdr6IsuAwTPDD+OQouNbPFVl
         3h+WW2ZeZ3joK3rb8kCO8JPu9DN9zrq+ioinvRU68Aq4Ddg6bojtMgvVvPCpgNmsU1TS
         +5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791989474; x=1792594274;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z3DSauD323e0qNhplb/tB3PMe0QiufBuk5MzkOwYu90=;
        b=HOUjJouvuqcOxmBfYhgr/XuWDwUnB05MRlkJW5rmZWplkhyWK611bjUlp6f3GtskKi
         XJvoU7Hxf8ZMUpVPct9N4Ki5JW6iNyAnYTww2LmvdFIwXB1nu5DRyL97GZO4HLyb9C3I
         TEVBZVol2rClfVsj2oIchQt1VC3bwuLrN9vvnfyFc8KNiVDIhXeXUdVh8Bl+1ytlxVo+
         txdy1zZ6micDNiD0h2lSXxhybYGKmSk9imykTeD2S5PqdHLIN3u9jN3YkFYJa3W3zASt
         KD3d7yEZQcr10IBlwSgmGqoMDYnwwCyahxIT9WrIiRgkTu6BJGDrfmLPT8qAdTVcgGg4
         Nj7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzSFTJLiCaCu9+uoiCohQAmXgp77Gr+EQVf4NNmpQujxfYy3qavj7hsPSLIbcTdHx0d9MkeiHazGCGqwQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIvI/XQHlO8MCue4CZ9ErXbERV7cZ+H0MWEgu99CtVNG/KWWlMx
	5JLLmtP0iuSAQi3EUK/d+LKUDN8+ngTdYmcdQQ/j9WHn5oXUrXpJE/CAsL+ilWU8qWxnukrTiO5
	BpPYQ4IwOLYLL0LshuvBiWfJFDsrRcyxZIw==
X-Received: from oiic12-n1.prod.google.com ([2002:a05:6808:a5cc:10b0:4f2:6bd5:e3a1])
 (user=johnsingleton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:1a1b:b0:4d6:9335:d533 with SMTP id 5614622812f47-50c5b17f9b1mr14938839b6e.64.1791989474239;
 Wed, 14 Oct 2026 07:51:14 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:50:37 +0000
In-Reply-To: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <CAHp75VdjeG2kNzfRRAmHZp=++gOz48ifnKMCu0oPK=nZBewHPA@mail.gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014145045.2369689-1-johnsingleton@google.com>
Subject: [PATCH 3/3] staging: media: atomisp: Fix parameter indentation and
 block comments
From: John Singleton <johnsingleton@google.com>
To: andy.shevchenko@gmail.com
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org, 
	johnsingleton@google.com, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	mchehab@kernel.org, sakari.ailus@linux.intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:20=E2=80=AFAM John Singleton <johnsingleton@googl=
e.com> wrote:
>
> Thank you, Andy. Just to confirm from my examination, I think the key iss=
ues are:
> 1) There should be separate patches for the comment-cleanup and the funct=
ion-header cleanup and
> 2) The preference is to do this for all files in a directory, rather than=
 a subset.
>
> Is that a fair summary of the concerns?
>
> On Mon, Oct 12, 2026 at 2:05=E2=80=AFPM Andy Shevchenko <andy.shevchenko@=
gmail.com> wrote:
>>
>> On Mon, Oct 12, 2026 at 7:13=E2=80=AFPM John Singleton <johnsingleton@go=
ogle.com> wrote:
>> >
>> > Replace leading spaces with tabs in function parameter lists and
>> > format multi-line comments according to kernel coding style.
>>
>> Please, read the mail archive to understand why this patch is no-go.


Thank you, Andy. Just to confirm from my examination, I think the key issue=
s are:
1) There should be separate patches for the comment-cleanup and the functio=
n-header cleanup and
2) The preference is to do this for all files in a directory, rather than a=
 subset.

Is that a fair summary of the concerns?

>>
>> --
>> With Best Regards,
>> Andy Shevchenko

