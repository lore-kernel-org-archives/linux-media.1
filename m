Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49417267B89
	for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826333; cv=none; b=pDOujjgXMQEySI6twyH6HvuFMSJpHgayLSpIdFM+17GmwZx9HUvV2Ujj4MkAwiu1YfcxFFt9+kSDNnE99pCF6YK1nFGavgunU6yu8n9ZzI6zgg6b3SyHf4Qu7akWJZP/Kl3YpsU+KsbF6+nt6rSVFJR4pFdGAcbSEkrJav51gbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826333; c=relaxed/simple;
	bh=7bw+O5WLaToHP2tSBli+IIhJTmS788eghpGopgDx+l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uYZyAgLvIh1h4OcZWcsrN/pAFMAlCcf3F4d+UZzFkX0GgIUHc9rYjbx7ica4PuSUEiimOBJpCZ5vQprr5GAh6FQEaA47XWqKOpos/t0E+GSolFNuu0D0l7ykM3zqD0YL+z1/D4s281jgyqgZU1yN0C7FUT4SoTa7aktM9whODbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PQ9vA1uQ; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PQ9vA1uQ"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5bd742ef278so1206921e0c.2
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2026 06:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782826331; x=1783431131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4FUqC2k9DGG9C47+8sXljTM7/f1XaSgmpyp+bRm68aI=;
        b=PQ9vA1uQV4ui4G2t3Hv3EC6nEnaL2pvCe9OxRpUzoGzZXsHL23TGgg1zwA3AeTFqWR
         pN6vQG/ZLwdkRTjLBjKTE+edgE20HtzsFo/rEd0jyvRSqch0ZyDIGKqr+xpaiqZHxKYM
         YCKJxmSvYxhPF3BNMJLlev5tgymBMlGLo8UvD3uDuFQgpDma8HwCQYgkyTUBmUGXohqS
         bdxFZ5yVLgkZp2D0Wz4dSiLZpZuXmXc2kknncvmE+dvco00DKT3pb1vBmu5iVg8F6fvo
         1kr9f5vLZWHEgH9x46bib81MPUFNstNBRWhyXBrCIoptuaeRAEj5kX/K1UxH3LLnd+jW
         YHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782826331; x=1783431131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4FUqC2k9DGG9C47+8sXljTM7/f1XaSgmpyp+bRm68aI=;
        b=RqTwm2pKXwQMFnI/v2bq16eLN1MqbssbEtJtbe33jWcysnYCWGG+wUP6GiLSsoEewe
         afERWYI7mgHlDWLPK+tMMUXGB6Oqn+8A2dL9PE3soehaureqeDFsblkmuk/vsxV5BqV1
         vpITuFM0jzXQOOkT5H8N6wrwXIX8LnXqwIS9Ms8Wwnxe86svK5kFBDxKL6NEaUvlIOdY
         zglL+kL8rB7JgSVgL3u+MwkYU5ybmQlcMmzZsyvHVBgNwUnq9kVb/nq13CEjvG9+8p5b
         PnqYCI6VvZ3prD71FwLjLR5q0H8JVKE15ogp890euiRHaknK8D92TqWG4vUBypEU4GU3
         O5EQ==
X-Forwarded-Encrypted: i=1; AHgh+RoPUEI/dwv0eIgXL+h7CV6aCz/KysQs8IdD/P/BM5WReIUftsd3LeZaa7LrsKpgoDpffzhoG/e2rywpXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFDIdw2kpMsUSyaJczkKC/rb+ShHoihdMlys30WMS8MQrQJreJ
	vpfSJ5xCplP1WrwOKKwNLEpb9UGo2H0B+vGM8WqRVO4S8Ybrp6VBkHUX
X-Gm-Gg: AfdE7cmGzWMg7Uw39mCfWutVgb/sbUXXC07kfSpfgtxeGbn5yeDvh2iGwFnGGGn8qCa
	fdKgn/bqPKUjtTFeo6qVpDYE6wcqZvHCaMH/pccFTIE3I46g3EoRShv/CundUMzLylY6cevPwtc
	6Ui97LbckyxFc758rMuIzKg7Y7na+G0/qNUOLOLlVBO/hH8LxTE4iUvlBcJbrP1pd246iRHk7Vn
	Y5iNpIcXdfwf8twKTSsNBICldPDr7PPTlKBL0R3vkhJH0aWJf6DlcrGAsUapNZ1buyJQ7FjPuLq
	GW5m9u4d+tEh4tU4kSJSCf+O+vomUcsQhwLDeApnQeAruIxz10eaK9L86EavLWhhPQ103RtP/sH
	gw5+zIasQ+AIUDtRUnLiAkdaTgGGiSx3FkXFJg8nCnLIPGt8+RUWnQtaXYf+zd337+IbbyquzUr
	qxmbpd
X-Received: by 2002:a05:6122:8299:b0:5a2:5c65:850f with SMTP id 71dfb90a1353d-5bdcf5d4cbcmr195881e0c.10.1782826331326;
        Tue, 30 Jun 2026 06:32:11 -0700 (PDT)
Received: from localhost ([74.80.182.83])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bdc1a8d959sm1359638e0c.10.2026.06.30.06.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 06:32:10 -0700 (PDT)
Date: Tue, 30 Jun 2026 16:32:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: atomisp: fix block comment formatting style
Message-ID: <akPFVbUVbdb7-9j7@stanley.mountain>
References: <20260630132631.25762-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630132631.25762-1-bohdandmarcus@gmail.com>

On Tue, Jun 30, 2026 at 04:26:31PM +0300, Bohdan D. Marcus wrote:
> Fix a block comment formatting warning reported by checkpatch.pl in atomisp_cmd.c to conform to the Linux kernel coding style.
> 

Run checkpatch on your patch.

> Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
> ---

There is a specific format for v2 patches.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

But the main thing is to wait a day between resends otherwise it's
overwhelming for reviewers.

regards,
dan carpenter

