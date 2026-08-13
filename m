Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2EEF440A1D
	for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 20:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786654334; cv=pass; b=sO02bRRzZx5vi4Kv3LRaeJEwChhPvGZDnWKPn/DCn33L5CUgNjPbiRB02+P7j5DHkR0R3fzZx1uzfN2Nlfu0GFR8lMsC3QAqAZ4uz57eaqz48QoWXRN5LZ+KPgnO//3vGeQeAp4aR+5HW3SxhIOLWquVS2+n5Hyd6ZN7GXZRuRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786654334; c=relaxed/simple;
	bh=fG15OhH2dzYlb4DsYjWF9/Cq0WDCMyRgsw5enN5N+IE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HppVU4ZTW3H+cEL8D82ReDI38LaMF3LmB8X/ZC0O5qZyZN/ArheMiEHMh/ag+jcMUZscWPxBd2wKNW5goiZlfFyrc/58EVNNWFQ89ARwd9CGDF0xn1TscV4JboSAR+RsD+Oru/0cJjYjabsPEAnkb/YxkU7b6ZBCTBGxAD6mTRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pbyA0gja; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pbyA0gja"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c169ae1cb26so258296866b.1
        for <linux-media@vger.kernel.org>; Thu, 13 Aug 2026 13:52:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786654325; cv=none;
        d=google.com; s=arc-20260327;
        b=c47WkFAPhhGgKG/cvsom6qNfqQ/aKXmD2RAZDLP+o6fLo4zevol97DdH7SBDujkBqd
         gh8z/o9waY6Kn4XfYvb57mnM3dDgx8uMnoLR5QTblk1EwXFgqI8+I0GDOsPvpvU9tdGb
         IPhucmsS3UuclQgtM16ASzPJyxEfD1Ul9Gg4m564/bx4Up2fXoVjh5YdmGKLPfByxBeN
         KN6POaV1urxFJEKvZuNGyxHyYt1FvuBuBH/yxMfhN0QFDmm+KcJFOGBLRe4vqOPxp357
         dScCDL40GAmvqIHCflvvPxB7Q5922sksbbZnOKkrHuCSKpERIIGdSPJIZiA9X0PlTk9k
         k1Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PmkC/SC0r1DtEmc1lwjFEmmXFkt8QZi8W/yEFPQjw4s=;
        fh=52wo6sM7Q+i/VlKyQiRkdFpv8XDJOrX8lAASpYTfJaQ=;
        b=ctYojvzcI2QVsmpKNSSaGl5AbHd62nXODHesAkgXFzKWSbDT+cpLXiFAMcTbqYpSrR
         0vj8ZAAYBRH4P46WZr93ZXsVFS9ps6HAezRb6cKU54j04Czadnh2oZa0EdPBiAdlehD2
         hCN4FO9KmZ4eOaiWleCC/XX2oytuhQfjL9dpHYyuhOL6wyw2pmRAk1Hg2iQx6UIzb3KN
         FQ2N718osuyMLOWCbsS/a03kKfFYNE/zM7edWkzo43RjEwABIbCWP8vD5TUylapouHir
         PS5q9KLOcErk+N5/hiP/bqGMR7b7S5zxmRUkoGWp84eb2x6A5cZMJnQYQDCnSbds5VLH
         mFyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786654325; x=1787259125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmkC/SC0r1DtEmc1lwjFEmmXFkt8QZi8W/yEFPQjw4s=;
        b=pbyA0gjamM/VLEPTbUvkfybP7bXNg6zpFvLNalrO+Pa6mhSVNY4r1OE0t3tS43+dLn
         Lwn4kuFvasLZvC1va2Pd/0QO9VGqOBPYc1rNG6qlsCYdvRcrDnmNeB6Qpazk1+y20uJC
         UL5d9VKtx7yfhpl/Wh1j9a33ro7094gyeqice0zpQqedKevDvmsEhCO0efh+HCraKQli
         aD8WSOPzu8rmpTznNc2Tybw4t61mYFatwtCW4vPewTloionHjVHDAcTmZUnUKKNMzxjk
         6NxfYoJRNGx9iG+K6Iq6Pz+LphJcq32TdYlJXaK8tD4qlXHl2PKy/tdty0AIMNxEeI7d
         n3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786654325; x=1787259125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmkC/SC0r1DtEmc1lwjFEmmXFkt8QZi8W/yEFPQjw4s=;
        b=QinKiDOgdiD0gI15PoN3A20zvG0h82eFx2uQedZSvYs35v0Xbm9bdMv4w0mMRcBCgv
         i2Go645RHV+Ot4sAFeM/EgI6x5oNFAQ1LbRTekVdnL6SY6N1kpyfFXWaKcsisDkClmbm
         lTZmeVNONBNHO5ao5l6khmEWb1jJbmOqUaMe3KCaKJ3n2EKvgd9v/topZGrtVHhHqjvD
         +w0e/7CdbmoxO6kUqql5SxEbBZs+b8q7Es8x1oLY8T6ObGEZ0NI4shkz8cBSusOyJGh2
         lWm/GJpz1BhE1q2NDHGQ1DX4tFS831wPJjj4ITCJlpVAAVxb+QYlvsjie90THaDE2WOE
         ac2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaY/ah2CM2ZvfpVp/L/O2fvRvwMd2r2RQvwGfzpgBeW43X1laXalU1LQISlVnHkexr2pkVRvVcT2CPCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrZ1kDM8M+W4OTDO4T8F0tQ7AC0MNvpxq4M8Wm2MgFyaOOU9/
	gHFC7wvBSxB3EBlB0rY+kklJrLFk9gJlPSzIIcbjZI4Ccg5pA3tCPxiei4zdoHHTOgEw3MdpkOd
	WFWkWo9sf+1f0TN9syzOgKfIPDaSfgZM=
X-Gm-Gg: AR+sD126B3NJPEE4xYgcmxgIgFGAWOBMFWObDIm2KHDIhdRhzrFQpiezv/IgVNhyij0
	WUoSO/ahwoHIS7+zWYxe/UIublbjwJd7vTtBcPm1dHKAMx2nVleM2DrEadSql5P3aZP4IbpqzLw
	vX9xwNW0TDWchXAdi4jfPChRE+7VnJyeFWiid2GAXWzPq/K9SN+n90JLytQM7gKSNUA9cOG/e3d
	izYArCCNofAQZ0JV0ORLpn7Ij0WZH4yKHN+LBZ7WysscIa6GPMKQc8nf7urIHFPSTUmGq5WfNuD
	hjqqHBdL8jtYdYoeZA9UAoDHjgmX09o8SD7DovRan1W01lNTDbs4TPQgAggsV5q6oF9d6WmgsDz
	UOFeufLjjVyj7TkdKXeubYaZZtXtfqHgZRmR75KTP3jNK5Yb6ffjtyjcIMnDJmnjQ8lXrAMy3s+
	oNftA0HMXhcOgaVvPUkf4NUAjUVZCN+g==
X-Received: by 2002:a17:907:d0f:b0:c08:580e:899a with SMTP id
 a640c23a62f3a-c212aa1d477mr42443966b.10.1786654325049; Thu, 13 Aug 2026
 13:52:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2.ref@yahoo.pl> <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2@yahoo.pl>
In-Reply-To: <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2@yahoo.pl>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 13 Aug 2026 23:51:27 +0300
X-Gm-Features: AUfX_mx_N9ZWgbNi1dwZpb3gSmsLHwluWxGJpTXUDWD9v7tdmrgt_mbDYd9pLdY
Message-ID: <CAHp75VfzB=kkU5996wMh5mjsVLMw8r15ENs9Hp+H1H5He1q9BQ@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: fix typo in refcount.c comment
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:59=E2=80=AFPM Tomasz Unger <tomasz.unger@yahoo.pl=
> wrote:
>
> Fix 'aswell' typo to 'as well' in a TODO comment describing
> refcount support for memory types other than ia_css_ptr. Only
> the spelling is corrected; the TODO item itself is unchanged
> and still needs to be addressed separately.

...

> -/* TODO: enable for other memory aswell
> +/* TODO: enable for other memory as well
>          now only for ia_css_ptr */

It's still okay to make it either a single-line comment, or use the
proper style for multi-line comments. On top of that I think it's not
a single spelling mistake in that driver. Have you had a chance to
check for the rest?

--=20
With Best Regards,
Andy Shevchenko
