Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61723644B3
	for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448001; cv=pass; b=iVf5hEH0c6uNZ1QHKxhCTtFr2qBgvOV4MmOy2C4O8aVsWdBE0kkNcRT45kMgwItmJ3k6AkOScodWRfaT9M6owlb6QJZELsPgaLfa+jvq539mDBbbHgx3ViwxV2TfVzqA1YKajXOyEtQRFvAgOsco4cYAZAQ4VyU08EOCS1qkb4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448001; c=relaxed/simple;
	bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bmpnJhs4gNHOXEKgWEGYVB7j96XukpoTyIWP/WfLe9zWOYBolFLUGnV8p5tYZqvVg17x5fNpn1rmZ1jIqvPZy0FwLU2fE1Kxn7wCkUD9lM/llJBOP/LaBBSIoIHb+z8/BJqDF/Gse6wMF4uboUTp+73ZMVcJPgndHHtryG10tXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N5NEKJWj; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N5NEKJWj"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c165a41a52bso746016966b.3
        for <linux-media@vger.kernel.org>; Sun, 19 Jul 2026 00:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784447996; cv=none;
        d=google.com; s=arc-20260327;
        b=HBLmwslvb8Cf8DSpc2EzeagGrQOaekAe94aG+DZXCjb35pqA5JMm8gdyf/1cBBB6jn
         V/afLE3ShO1D51VYEL89M0l+qaeZt76tYDP606cMBAtozqWr8DDU/eRd4Xp+cn4LD1TW
         3goZ3qvZ5K95iLQFA/y7aXgeZmzyvKFb9cwVM1p8lp3LBL2e+decB9XJWYkaTJzSB+we
         aYHAmsQrChqjIolZTjqgmeHOXum1vZl1f3qcefDLtdCyh9FgvBXrHLn+95gFZduSV5Z9
         WSb7GChwX1ErqY02EKj/61AUqAULqXHvwrMU1dmAgOAfoTHI9/zDnIgQQcUqbb6YrSBw
         AzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
        fh=nwuiVZl63y6uj3k7fdQK7qaTIYD4zX1JyaaDMvqNG58=;
        b=Hq7sTMQ+pzRjO44Cz3pGlKJLJ+xZxMRBmRd3W2QMVrD5+VnrX2dUx+eL54oVnoCe7Y
         W0dQvd9wR9riRgKd30W/LQKcIYlx097HsFd2wMukDu/uh1sMTtOVia+Mb99V6X+VW6dl
         7XtmuB9xpdl+C7ToT2Xm9guepXgLQKXJ/eceoGPTJrPl20+j5imuUrnKOPtGwt9X6D2G
         7SfGE/ZsGaiAhkjuMoabOc1u02Vf/zkBUoYSUxlCSmO7a9jFUDcBWkgBG80lnrQOBahU
         qD+hAMAO7sJkmAAjVUhTjfwV8KG5v9EKuVLrcnlGq9UuusnBckOdpEMxIPV6l1kguMTT
         5Rug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784447996; x=1785052796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
        b=N5NEKJWjFH506K2zeIKihKCmv03umZTUHxhWHcKk27bzu6GMEBXQ5dkAtP8aeX10wT
         qiMzH2qGUkgQ36J2DKuesbS+Ubmdn5DbAw8PkFh1db9w+aNS1P8veAxwXUpnS1AKUouz
         2xVPpQG4bIYQz6gQcsnG+3xJjCQEU+v7VL6VoaOjTxQf/UyJWXFq5wGtdWvcp+zheS1G
         tWTxD2xjkH1/b4DaqDNueZ6inLOgt42bSocy200HH/cSv8T91KyaJnPAKkzpmgoKuwYg
         Vn7y2xIj0e2CtYrHfE1szf12a2/XmdwD22emdyMB5+QyxNgjpZa+sLbQeGNmmscNCnIR
         a5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784447996; x=1785052796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KS1bRvm+Q9h9PMyilTvbmVITAjaqgkwJk0v5BBO1EmU=;
        b=npuy8PJ1LnJboTbgdFOadOv/a6BDySw9KwJwrC9EV6qxxAvFq1yrOQ3DM4JPYQKfMt
         3+oCKVGvkFBcGiLP5aI/n/DaQtpA5Y9dGtP3DeflvrfrD8UGKPJvZtJ5m0lsOopoOa1U
         JcZMUeXfYRT9NkUpMeLGRnKLjBRx/ik38BVFOTYjfWGg1zHF1NNANBRGAIR+XGnJRIJW
         G54jLbIiKrDlioOXoTDYROW9bSO81ANMrsd68YAOCgIUYhzHwwS79XqeroaYqZ4ZZ0JC
         MFPQOu+usT0I9MGlHDdXeViYXhOg1d25oHmaO8qXljv56rUaAelmLV3jPW312z91cpnF
         aVFg==
X-Forwarded-Encrypted: i=1; AHgh+RrnZjHSILCckc0hQliU55bwb5RxvwsjugAPYVHoEvu2mCKrHsYtNB4szXQH826FmyyQVHCt4M89Scaxkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzywtUIBArjlVtAQ0LWXxAr+BY7D0KwijdSztphrIPgi0bi7seO
	J0PR6H6fQHjIvCh7wksc9MXL6PBekHZEAJDSTH5/VU7Q88T4XJffMQHu4COLksURwz/NTPp/A+j
	ZYLK4enOMm93d+iZrTJv09r2QKR5JrBk=
X-Gm-Gg: AfdE7clFqm6gDzvivvnEZuySXDAWcJ8NNByAyo+j+kVI1bwRcvH1Gkw3ubw7nyNJ94I
	XZ3cOi0kdYrMuyEE4eHK4AqYSP98H3AWfW/d4zXKNQuvuyaMinQwLTanOHt9bkxFL9iwqbuY+Sm
	fAn6jhk2h60hTyIJ8om1AHHFsfxzc0JZynp7okirTRK1Vi9eKuXzbtr+PNc+B5aALFzPeXOWTAZ
	LpPARZArjNb8IdxHUy1bEFuq8AGAeai2zkxivypAyDfz7hypaZ/5eXbEmUvGl2f0MN0Coj136vq
	PMsDh39BtXiKr5hKhIz+WiBO2d80R4O8M1VtEgQevqHKhGyh6tVBXHwPblZcakCgbIx5TaMb8pr
	h12REsp/62fRiRjHgdnEAIqSTg/djsOWZsHLqYOP1Y4sA80w=
X-Received: by 2002:a17:907:98b:b0:c15:e5f4:63fb with SMTP id
 a640c23a62f3a-c16b47bc68cmr415821066b.59.1784447996091; Sun, 19 Jul 2026
 00:59:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718174203.21591-1-prajvalchaudhari733@gmail.com>
In-Reply-To: <20260718174203.21591-1-prajvalchaudhari733@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sun, 19 Jul 2026 10:59:20 +0300
X-Gm-Features: AUfX_myK2l8xlmeaRic9whd9oSfhI2t3UA-n5OuABKumNve9JlIhXpC-bHdiO9Q
Message-ID: <CAHp75Vdxt3byDm+MTXbUpRUiqxv8XGwok5bVJGhdSb_g94wZEA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: atomisp: use sizeof(*pointer) in vzalloc
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, mchehab@kernel.org, 
	andy@kernel.org, sakari.ailus@linux.intel.com, linux-staging@lists.linux.dev, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 8:42=E2=80=AFPM Prajval Chaudhary
<prajvalchaudhari733@gmail.com> wrote:
>
> Fix checkpatch style warnings by replacing explicit 'sizeof(struct ...)'
> types with 'sizeof(*pointer)' inside vzalloc allocations. This aligns
> the code with modern kernel coding style standards and ensures the
> allocations automatically adapt if the pointer's structure type changes
> in the future.

Unneeded churn. Is it for some kind of training session?
There are more desired activities that newbies can perform against this dri=
ver.

--=20
With Best Regards,
Andy Shevchenko
