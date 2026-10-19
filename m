Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F42149505D
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 07:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396551; cv=none; b=pc5smNeE9jyw/HslOWq85tWpmJ9MlQqROrZkvL1tcVMeRtLYyVes5D8xZ64eCaSnBodQqpQzDiCKqCY41b2zWtRfj4tAGZWhU/B1sLsH1fpeYiOziUOv5nxAcXZ6itzAr4QyP4RQITkENMVh+tAkG2RkhUOvaA2PAFURya9Fj+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396551; c=relaxed/simple;
	bh=mlAe3AjeK9BYZYdxRq/4nX4DbKBku7NFQCg/IxQ1uPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m7kaaTvc0Mj6Xn1XknRCw1X+vR6FULPc4PtR+fVEkJHFDFED1hHj1Zm4jEUDJ4QoKVWb2oTzZ95DJrS7S0SxNS9flRdtDBzYYTs3Tp85HujBnwuvGg2aJGELLK71Dti1pkxNHg2einLm8l6NDJQ+wT3rQNugVjM7txWIgryf7uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TvC3r+fF; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TvC3r+fF"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4d870d54so1037483f8f.2
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 00:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792396547; x=1793001347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlAe3AjeK9BYZYdxRq/4nX4DbKBku7NFQCg/IxQ1uPE=;
        b=TvC3r+fFHLYOhuYXGnGj2B8H3XJK0L86CeP/pEo71zfD6bDMQqOvfKPJ1WgpePMPMY
         7SgkGJJyQC7RpjuEptXzYel6VrM82rvmZ50NGqxz2yzmq3bZmEmgtbfQtvTeeykjdWVw
         am0ez8M90Zq4vyfr3/6kkofUzPj+BhsMu72Fiw5tmowUujbFKQS1Du2xO9YWnYCrszys
         GnR+VD5lAQOKi2fD0haCBwk0AmYY24dRDWnZ9aUnEjox+afTGvkiZHYADKmUL7+cVZ0x
         sLVHzCMVcErnDaxcFyIzH179TLtvfkFriiF411gxVyFSQFy8r046M88L0mhqmay8FtUr
         NTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792396547; x=1793001347;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlAe3AjeK9BYZYdxRq/4nX4DbKBku7NFQCg/IxQ1uPE=;
        b=s+M1kf6UL8ToNAWOYMCciAxNVgEMXZW3HdC5jguqV7dgPVCbAYivDfU3VDfcjZBEKi
         1IKKXivWdZ2Cgt9Y6NbU2Ujb1QmNLSZH/y5kgpDpE4dLxNaN+soCFc4heWT0mI2MCHbG
         PZN1xtGe++V+d5eO8hXxL9dyd+PrauLp/sv9sKNS/7b5rti7s9stpn+NUWiF7oNcxpB1
         GP+QIV4Zwh2rRJOF6R7cj68Z3RNQ/RiqRVXWqsFMdQrp0UWWQMLaQoGHT4ggYGnRbIBl
         lG4fUJNrL7FTnYKODpwadUzQcm+6ItMDolc3bUXGP5C40NdYiJRGMQPab8sSwdpJFpNS
         pIJw==
X-Forwarded-Encrypted: i=1; AKwUvBwJB5tsiMg5uAUqRC5r1hBpykS6RNl91ukImRTz0JjTmYEcz+1wS3ULKMYKZ+oN9ktiKf0zn/fM2vAG7w==@vger.kernel.org
X-Gm-Message-State: AFq9FYL1LW0KDHXf6wybO3h1CvM+sxJPKP55LaCaep2EbL19se+fkgv8
	uel6zG16u4mkT+f5R2v4QvJjyKmpHTS9BmDSOt/G+IuP/dD+t5RphxBd
X-Gm-Gg: AYBFou1vRo4ZrtEDI0oRsuzNGKMbnAng+dZeworxjleyeCxubbhKue/FtBKtoMIHq0y
	nvk0ckQw+F9J8+U/zaZUX7MOB8G76XaveUGorsQBKmkfZzNhxyEeTRFhx/mMcBF+EhkWMzSCqD0
	nq+y/caiwAA+dp/2b1XMVNe778H1ayEEoThwU7f1PyCgGbJleshRCkN88h7Q6/X7qcSkz2UTZxs
	RYkebiKtqIRfRI/2fu0LVVhj31VWUEVQLWgrWGZSpdOmAKTZArmJWvO8hZ24XyPuTDJfUesW7Xn
	saQJlDFujEgaFWF7NFYdHKYlBlUEYSLtesecoY5w0aSd69D73VIoIGJrR/DNYFdr+ArsLFGuS0i
	Y8rZ+L3n5qvwNOTOMGNN7SRjwl1I6ywwfY5zqX9/TP+oqqfFxtlkqtWCFuMZo5zyh7d93Z86qvj
	IA3xrxTYcGWICdV8EbkiBL+HVA00bE2tb32Rj23EqkRWXsEVZRY5fXTNXzTBPgQ1G7MOF5PVdGj
	LaIUrji9b3vhWq+jRi3QHOCEIobN4s82YgaC46A8k4rHAK8hvBcgo6kA1pFtc4bmMbEsS6J
X-Received: by 2002:a05:6000:4549:b0:48b:69d4:bb35 with SMTP id ffacd0b85a97d-48e07bbe545mr8225776f8f.12.1792396547354;
        Mon, 19 Oct 2026 00:55:47 -0700 (PDT)
Received: from SP11X1e.cable.virginm.net (cpc99340-croy26-2-0-cust244.19-2.cable.virginm.net. [80.193.62.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e7ff1sm23031367f8f.25.2026.10.19.00.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:55:46 -0700 (PDT)
From: George Neacsu <geocausa@gmail.com>
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Cc: Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Peter Marshall <pm@petermarshall.ca>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: vd55g1: Register as a sensor sub-device
Date: Mon, 19 Oct 2026 08:55:45 +0100
Message-ID: <179239647935.15604.9766459518321501523@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7247f5b5-5eba-4afe-8287-19731e71d4b9@foss.st.com>
References: <20261016-vd55g1-async-sensor-v1-1-cd72f6d68ea4@gmail.com>
 <073e5fa2-313d-4d7b-ac10-3a74c57d3c62@foss.st.com>
 <20261016145542.37322-1-geocausa@gmail.com>
 <7247f5b5-5eba-4afe-8287-19731e71d4b9@foss.st.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 09:49:42AM +0200, Benjamin Mugnier wrote:=0D
> Of course, I apologise. Here is the correct tag :=0D
>=0D
> Reviewed-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>=0D
>=0D
> I think you'll need to manually remove the wrong tag for your tool.=0D
=0D
Thank you, Benjamin. I'll remove the incorrect tag and keep the Reviewed-by=
.=0D
=0D
Best regards,=0D
George=0D
