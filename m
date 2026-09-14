Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1FE35DA79
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 12:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387832; cv=none; b=uZ6CdxdbC4xkDiPbNKAjSL+x42jXBc7QbXqBnlNzhZawF1wr2n+rryZCuX9gKZPjRfK3b8MqbwbCgjhSdAuykLU/Ug6O5Zq/m9CoCXjzKWDptvB6RKjA3xz+sUYBKUuwsk35rzltpUQaIdQ69Kv/BNPP5nnnk0BhY5yvh3P7VsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387832; c=relaxed/simple;
	bh=Se7NkzKRBbstIWMyWUOVe+AMD6O75GbMwW/t+1YRS3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TqrcM9PM78Jd8u9Vcx20WmlfYdR/Aq5bIu2NmCLPJjXonDWC2AzGd3aDDH/uvuD3pwvwGnb0TUcTbxyaXQa4sczoQKqk2Mkl30NIv66STsTOfVetxY3+wC2BaOh3coeUEt4mzrYf31bJ2IiJB9TcCImgJpHxvOL+hwwcy1oMnIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JlWuwWtx; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JlWuwWtx"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-7f4f0c89e35so1167615a34.2
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 05:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789387829; x=1789992629; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=JlWuwWtxH51nEvHn7rF4rdoYC+mKObVerBorCAzI+wqx4svsciLn3rHQDBxyBU/Gcf
         HVDeXuDpwgUQ5ma77MiaPMO8pt7haDKW6ohqTldYLQGdza5uL/J0CK0SKAm/qgEUk1Eo
         FlaV/8RJioxINO1PT2vVYS2NV+h3X6OWkvNLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387829; x=1789992629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=26Uw7zNV0CaU8mcuuO2rFoHLPl3S+teCO+5Ml7uyCio=;
        b=b+AIYAFrfztIMwDkVGoUo5tDKpkO+9VtAJy5KjOEPZPq3UDdKcxuFn4nrDv+KBUAGj
         nZuHdAyALCb7hYymLwoDOOdmIIFMQ+flhBy3JN2oegyQNcxIgANTK2LcRhPnlJmIcicu
         ZfUuKMJHg4CWyG82wvL1HGI5xWaIlzuuUW+eVDdkm8kHGzRvezlPTe+ASmOhJo6/GW26
         KScWczsEJK5dGWLB/Si38s/MGGSM2Ka9BXEFaC0oGg5EuVjeY5VaEOywSdW/lJhxz3yi
         /4xarZWZqI1w3qiNe6RV27gIFgLzUQvd03qRdknUnLrwpRDMRURKQzeXxqgBCO1758Gb
         Ssxw==
X-Forwarded-Encrypted: i=1; AKwUvByj3vPwGvR8y7RxbBNEDMcGhPSPCpLdHbBfQjlXItcLp+zyF1vMvNWxBwQq+sYBcUTWVnAsxE8/be4LXw==@vger.kernel.org
X-Gm-Message-State: AFuF++kqIvaWRaF1ZUrYEe/IkjnBsrZqB68Q8JyDetrwtt2/PmxOgGUo
	yWn88QiCEaO6zQBJ2sUoX46HpeOEYtX/rD1QyyumUBxJ0DsymNCCtoZ7QGX4T951zVpZXXAjvyV
	gXUvmb6rz
X-Gm-Gg: AYBFou3sDm69nWNlnncrM6Qyszna2XZ/LTmwL87rkS6T1O4hCKPBEQjgTcieJ5uD6P4
	VOlxqGtnS/EMeILpC/HGBNov8OGRHH4YYkaP2vnHZ107kcOhyn1lcjWLX9Sn7jbloojAo0hON+Y
	vYU1jt6Se/AErgdzDW+tiADCFOPXLVNzuA5X3xs/bu+uraHA/lxyhKvN/f/bOK+9s6BWCjOVTBH
	3pfpb/GnASL8io+z77sixvLUXEt8uA3THJJb8PdhKxg1wzEYPICd4LLTshb0eBWm6isdPPnsO4+
	Zqq0B7NRrnUkpf+QIAkXRyiemNhaiJuBIyAxDaH9C32pYDHpj9uGezfzj2UsLYia3cDIjrOvE0l
	eSj4xPMrqztaKOc7bs7NzSRcczmIsndWqrfq4eZjdzLVkm95M4bO0pa5wJgbPzb8QF5N7jebJUi
	R+lqQETABqzBKqC59WGSWsd8Nb5w/YUHKE4Fc5dD7NlBHDe6e2coEbZDDzIRUHqWGGMdBCg073U
	NZtNY3eX5BqRsjBB1pzqWwlACr6uj/zU8Vl7lM=
X-Received: by 2002:a05:6830:7009:b0:7f4:eb76:881d with SMTP id 46e09a7af769-8089738bfb8mr1313149a34.5.1789387828985;
        Mon, 14 Sep 2026 05:10:28 -0700 (PDT)
Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com. [74.125.231.171])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f59e04a0sm10502692a34.8.2026.09.14.05.10.27
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:10:28 -0700 (PDT)
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6b2010so1183814eaf.0
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 05:10:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxtyiJMlQIFCuml3RXVPuWTscjAacgQevJMTu0WVvrjnJJjb0Kg745rLJneoOmzHzcYv11OTRerghc8w==@vger.kernel.org
X-Received: by 2002:a05:6820:1f10:b0:6bd:cd33:b885 with SMTP id
 006d021491bc7-6c541b4585amr1031566eaf.42.1789387826624; Mon, 14 Sep 2026
 05:10:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain> <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
In-Reply-To: <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 14 Sep 2026 14:10:10 +0200
X-Gmail-Original-Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
X-Gm-Features: AcwNN1WrtThLwvG4t-JyEDTnuDjJJzAFO-QYuNebGgduCRp--_WjKNF02oVq8vc
Message-ID: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	dumitru.ceclan@analog.com, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Julien Massot <julien.massot@collabora.com>, Rob Herring <robh@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Martin Hecht <Martin.Hecht@avnet.eu>, Andrian Suciu <Adrian.Suciu@analog.com>, 
	Cosmin Tanislav <demonsingur@gmail.com>, Vivekananda Dayananda <vivekana@amd.com>, Cory Keitz <ckeitz@amazon.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dumitru, Dan, Ricardo,
>
> On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > Can you check this
> > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > please? If there's a single patch that needs to be modified, I can squash a
> > > patch into that, otherwise v17 it is.
> > >
> >
> > These are the same warns reported by Niklas in V13. Dan fixed them in
> > smatch in devel branch but fix is not in master. Testing with smatch on
> > that branch yields no warnings.
>
> Dan: any plans to merge these things to master some time soon? Or:
>
> Ricardo: could we use devel branch of smatch for some time?

Do you know what patch fixes it? If it is easy to cherry pick I can
add it to our list of smatch patches
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads

>
> This driver has been waiting to be merged for quite some time so it'd be
> nice to get it to 7.4
>
> >
> > https://lore.kernel.org/all/ai_txjwLPHsSKsJI@stanley.mountain
> > https://repo.or.cz/smatch.git/commit/d12183645a31b737d7fb39cbefa589e34615e8f7
> >
> > v17 is still needed to revert one breaking change introduced in v16 and
> > fix more findings from Sashiko.
>
> Ack.
>
> --
> Kind regards,
>
> Sakari Ailus



-- 
Ricardo Ribalda
