Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151A046D08B
	for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789391466; cv=none; b=ekKoWzkXCguWqgaFccUhCwDQf1cOWfMNt/V0S4kc1pJ1iH66wNDFTfzN5+pac7hNMwqJvHGZv8v/BWDakm+PtPJtD8agLVjn2zGpDmkjvLyLRnfAj5iXzRQNiqWRPHAW30Sk0lx0xFTZWZ2ryz/X+4dGbsJhtrP2b6vIsNOlQGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789391466; c=relaxed/simple;
	bh=iwfdzr2iy+sC6+czneLHwr8xAhX/X+iDimNm1BSeY5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hsKVnHw4jFWRMzAelHxeJaLindHKcXp4FeTLmrNohIiT9F3rVsp1oZG0Kf3CHNBTYxUvelr2DwPYBYgmniu+1YwmkBKVrjkLP9U5x1juKWLYU0lKuAtuWeEVCilwBDwnfd6Qi7KktGYDBz8s+ZzuzhrDV+LQVcHxDCMhEpuMd+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nVHq8lnG; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nVHq8lnG"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c1670dad7a8so578930066b.3
        for <linux-media@vger.kernel.org>; Mon, 14 Sep 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789391462; x=1789996262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rHHo4dn4rFwPjLFZeXv9ABL/gp9nPfJCU+f+sXBzG+Y=;
        b=nVHq8lnGBWVdBIdc67fVSPaF9/cTT9t83+WwvFjCZ3e2vWzufeOFAFVzjl8BQfIOsU
         CRfMhurFa0ylgZJz5eLBuOgzgWQEaC9rY2FNq0ZrStS2+N7U+g19uKbja1+6Fqn+Sa4i
         hnCbFeHPG0r2dqbgPEtMrcH5v6gA9qaV/7MXUON3EyLpUgxePSovlba9oZP3+KjDZT1Y
         McY+xoXtLVziazvga6QWylC8adQuQIdaz373IZLIsofvg2/JVKaxkfCz7uY0ypXTFvxw
         dimuIr3vDJ2XfZjxov0ssqBLtwdHAzuzetldEkVd1dIbo6lxpAQIHRnpLQ4skyJ19Ptr
         zo1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789391462; x=1789996262;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHHo4dn4rFwPjLFZeXv9ABL/gp9nPfJCU+f+sXBzG+Y=;
        b=O0s12RvwbQ1xQIqj7xgjaDubwL/5BihFuHVXE9zCtBD1wxCYuEuUwXiC20yyYMEMB9
         ALuL9z4056/Xs7YA96t9YSxrZVWAOhb2sxHo3sLFYmeR6r6KokONcpoqU93rZFDyw9/k
         9CTWWNJAxdVJh3Ja17d/vtyfMXLUgBNjc/mF9Pun8z0X7p+WbuhnSkiA59XGpeQt6wre
         azf82y8Q9RCg0PuXnh687sxwQYBX6cy2HFB9W3dmYb2PfzGf1LzziHMDjSYcUfdhUxKf
         0fwFtdVh62RAH1znaqJHfvN36nLwvH5r9HqsAmitZsCvVemDd90dCFGLVF7zlGiFdMWF
         VSBA==
X-Forwarded-Encrypted: i=1; AKwUvBwd39+gTNGuCpoKo+dFzsyifJenlOQpqWkMQPooR07meIE+3l3yPg0SNsx8kb5+NPL/NLmZy5d7lGgfdQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nljnxDHctiOqb4LT4Ke6grAhujKAFW2neXngKEftFbEhRnDuoH
	nIHvI9MWDQ2DdS0/K/MUYMmFZtpdg5Tm/uXcA70jCW4b3VYKy8sqgGg5
X-Gm-Gg: AYBFou0NMbgb4R4ciEUiHkbCDonS2+m50zgz6UZpVDk7GjGbA8Lq+lVaGNIkGi8zCIu
	cwS5MJQ7okoXuNTKhD2+GTMnSj9vskx9iFtkfton6SquBQzRnUvGPuUBc0qy1wrj1cgwRNOXpfs
	G4u21sAdOMj22ZRiVQeHMzf9vTvJIqveWDluyE//+zy8v6cnrA6AWwaYtZ8qspr3fMIybFP5qU2
	5NKBIYzKfNQXKWq8gPKa2SShdyRc8wHeMkCpkOH94mWOQcJr0XkiQE3wAog5DnI4ata0+DLbWVy
	9/KH6tc03XVRH0Li7xoALpFPJzdl8w8ihqfRvpV7txv/36CuHC+laQlBLr/Sow0GRY3BKitCDu4
	Wbsu/yuvZUJ79ZZuHhwBz/SD7hCdEVCPRbyrqY0fl5x5GslKTLtCQkfdD/1Y2tb1oOCmgtG4fhR
	en/vmGr7xNkChYXTY5Gd72pmY+OB7grl0/DnlC89g9iF7VEbkD4decBZ9qnWxVezfpbT5KNvdoB
	DgbKQ==
X-Received: by 2002:a17:907:f497:b0:c26:19de:912c with SMTP id a640c23a62f3a-c29b86f1102mr156986966b.31.1789391461783;
        Mon, 14 Sep 2026 06:11:01 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966021ae8sm429403566b.22.2026.09.14.06.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:11:00 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:10:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ceclan Dumitru <mitrutzceclan@gmail.com>, dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aqfyYSagcejWb4xD@stanley.mountain>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
 <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
 <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>

On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> Hi Sakari
> 
> On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dumitru, Dan, Ricardo,
> >
> > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > Can you check this
> > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > patch into that, otherwise v17 it is.
> > > >
> > >
> > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > that branch yields no warnings.
> >
> > Dan: any plans to merge these things to master some time soon? Or:
> >
> > Ricardo: could we use devel branch of smatch for some time?
> 
> Do you know what patch fixes it? If it is easy to cherry pick I can
> add it to our list of smatch patches
> https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> 

Commit d12183645a31 ("precedence: silence some false positives")

Sorry, I felt like I was close to merging devel but then I started
another major surgery to the core and got stuck.

regards,
dan carpenter


