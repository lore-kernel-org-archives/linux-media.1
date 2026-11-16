Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794832732;
	b=dkQtRo7Z6/pabXWL9xIyQ+cjFtMbmyCjtWeFCq7bUkZRk+t4gBcLUadOMWHND8h6J57T
	 b6uZMpFftGdBYPpkW45JDlvw0MTuegoAhaJwDmonI3OYYOhAUEOkd8UE9IVCbXvK1PUIM
	 YV+QizfT3RHHg2c/3QKZGuQm5YBfSXXhtf7T5VexpTUBWyVLYh9AqbqrDLWlcqchIy4xq
	 bQSjRTkHBSiw7+uKOF+Bbqh44e3hlkrBbk+p2mTcqZ80FHaxQUqE6sDTzfoQ0tYLdUlmz
	 bQv9OSnWqJ67gs54jmapYkkcF/erGiKWnSlZ/1R9uYEbwkMiMXo9TV+M2ltoqoG7z/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794832732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
	b=DEk2Zml8klvhaQyX4qWiXBx+vMjUF+1ajxc1cfV3Iz5xES2D50mlZin/jajXxx7czp3y
	 MBJsd2F3H2hTAEh/SfOq/FuJx9uffihKp70jCEIZCK0YXoRdOBGS8GsbRPkIYoOD4Hv5o
	 69Axfqbs8lXSavHM240hMPklfVLrrXD1JodXpGIPLWutQX1gU3wuXbex3qtXAml1IxPZT
	 7DNo69Jm73Z5Fa9xOfj3fvnNd1hI+ipbVA5USVvJDru4SK3RHQRPUp+sZZH7+GMep3TaT
	 P4gc9FLy/tQM5NXBnmdUhkW/iQ+VfTq+H3D3FwhScwhjLS8oPklsGvHUUQ55pKcAZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwtVQorC;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C18606A329
	for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 12:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C18606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nwtVQorC
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c50abd5b4fcso287367666b.1
        for <linux-media@vger.kernel.org>; Mon, 16 Nov 2026 04:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794832731; x=1795437531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
        b=nwtVQorCev+xidg6/G0Xnd8EwYCES7B74F9FBb177/oQMt6yREPQ9fstvg+bBb8rh0
         yb1lWkUz8yMT6kuyB3jZ0X/nOOpWoYOx+NMUP45qaU/7no6E7W8JGgOrPZGcCtLRpgTC
         XJHCo+dDczh6eZwh3MiBjbTAG9mGRDRmSa47Uuf1j/qyrxieZQ1nb+gWP6ovhCKPplC3
         Z3OcumTU/ysjViYZDKfzn6DeVq3znCJx2QbaVRtX4CVoG7U1YVhLnU5CUpOgWa70acc2
         qkYQ2gX7vu3/k2glwHGqyqWiunZ4fblkHIxjEZSs0CIXGeqylD0xsrvHcXAScX8JiHZP
         J6fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794832731; x=1795437531;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3PZYt1daQSeYExHxoL5A7mAZahkiXN58Qu2cjjFDeCI=;
        b=heqdbzgugTZ9ltpmRuhxHixwONYbWrUpouR57WsUeRUVoDtXogdO7sHVhCDWe9n4ss
         D6PPeV/aYlBvviceLc+9AxdGUh2SVW3wa4FeasiOpjZmpSuHn1No7pm/JATOXh2BGz7m
         ABLw9Xk3NTJTvEZIk+ygTfrC6aDlAqQQZTx661q7WTd6SVGBHGUUY+yNJLjvhbHmL58h
         QCtPVxxLHtleIjm2sXlz20NUkKXicepevenVeVBSGfEmTWshA/9zJe525e+fbuQUhAIe
         EqSBkumsTNqNcMgdH1gclan5eNFiq5HnzlbAqBTBpwDUuzeZwPpdiVZ5mpDZTVU7LQ9i
         bBaQ==
X-Forwarded-Encrypted: i=1; AL+hErGZPZyebdROLnW2KDiYWo1nKiTIz6Q92cc8uWyL1FqLRDNlmp9c0hCkn9lmeUPsUjJg3t3oogKxW3JSAA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+XEBXlrHfmTCiylO2HeYi3dtcIib+BrK/ISQmrHIjlzPHD24Bb
	QyQww+wdwkgi0qEj931LqTemcXP2aeSLUKoiPLzbj6Yny1y4CTJtJ0l9
X-Gm-Gg: AYBFou3G9ZBdnCyOFW3utje4ZRTtE5h57/wW2lqGDJBKYqMSFekjABULg/IeJbFcbfV
	GnWzlL0TeuAvVayg1JFTxqLpwtLbR4eiCAtRgwLp73lO9WPhFh5wokv5BsmXvwgufEhsL9zKPvB
	hLRQTBx+zG2U4G0gS8EfRfdA1abcTsx4Dq//0DItIau1FAi14IGEsaWqIdZ28IJ0T1Z8OJOPxFo
	Mv0qhXh6gGYdfm3aexff/KiHz33sZR/b4/rEexJKnpdOd0Am952EkQFGrOFGKddEG19yfJMGuFL
	yraJXKjcx1FpZR5dpb63W2zvGE7nKiy1Vl9JM5fb9LTORUiTAZDmJeWbc+FbZAe/fA5wbkkjt8Y
	EkgFOOi9VN9UpEjCpShqHHPbx9VKVO6AnaXqC017zO+97LIsi5RhcAzVurYoPDxlQdU2auyXHCI
	X7+1FWu5hfDUD5xgURNNTFXHM8lL+oQY4yQYaU5jT3z+E2ycJuWze7iUZGusL4H57rq9Ctqa0wH
	+wJ8nh1Y19ql7wDd6jtbG58MqfptHGS2reSgn4DtxC9eALN7NLvrxOc+ZU/tWO1azBLl0iDBfrj
	2iFp4kibeze/rkGmWBipNx4Q/cX2EeZycDbJMW3/OcKB2xPc+J+EnfkPXF/IknLxQGQxJTPb1G4
	aUQyrebCxgKv9tan0PO+YKJ/UZuPCbdgPPpOoHvAiyXqa70HPqQkVL4FOhggHdAtsMpuF5y31jL
	rkMTsDAbXYoxJc
X-Received: by 2002:a17:907:7b83:b0:c41:b4e4:7958 with SMTP id a640c23a62f3a-c5095dd7931mr810371866b.0.1794832730779;
        Mon, 16 Nov 2026 04:38:50 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b79d19sm408995966b.71.2026.11.16.04.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:38:49 -0800 (PST)
Date: Mon, 16 Nov 2026 15:38:46 +0300
From: Dan Carpenter <error27@gmail.com>
To: Avishek Chaulagain <chaulagainavishek14@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: atomisp: Remove unused get_sp_code_addr()
Message-ID: <avr5VoP2Xtc3Chpe@stanley.mountain>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
 <20261116120703.6681-2-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116120703.6681-2-chaulagainavishek14@gmail.com>

On Mon, Nov 16, 2026 at 12:06:57PM +0000, Avishek Chaulagain wrote:
> get_sp_code_addr() has no callers anywhere in the tree. Remove the
> unused function and its declaration.
> 
> Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
> ---
>  .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 1 -
>  .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
>  2 files changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> index 3cd69284f..e00308818 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> +++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
> @@ -26,7 +26,6 @@ typedef struct {
>  } ia_css_spctrl_cfg;
>  
>  /* Get the code addr in DDR of SP */
> -ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);

Dangling comment.

regards,
dan carpenter

