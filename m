Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB793346A6
	for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 21:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787003515; cv=none; b=NHa7C4eHewPb+T+C1supN5YXUDIHGEOs88YMMVEv08sS0td/pLjM6UwnudITkOYzDTdBlj6sVt0R6hj/9Ga3sesWYALimrRJO757kfMWk4wFkgJCeVtvIGooS1L0WG/pFvv99rOsKmGnjnLzQmVBfdvqSBOVYRPifftBxtKZu+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787003515; c=relaxed/simple;
	bh=xJUnUoMS0efqPdEWh6VyFBSW/fIK2d8cOEcdE1MOroo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=Cnl1X9F1kKGqCZxsgh2fcokrTmv27HbgSvhmrKbw2IInaRomO835GhVm2Hiu2lw4URRxJi+GPJaHUCNO9GUBViQDNrNfjm6jf7U8wltPNcu+8C9bDaTMtIgdV7OCtVXK96FlKrlhG5Ha4T4k+tQmntQZ01lfjWlL+/1unxadVQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WbSDnMZS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WbSDnMZS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-472326ca506so2745245f8f.2
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2026 14:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787003511; x=1787608311; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xJUnUoMS0efqPdEWh6VyFBSW/fIK2d8cOEcdE1MOroo=;
        b=WbSDnMZSky9cLeBu8dcHfx4VZ/2z6prlUwVz9VcVvZjsBX0LKxCCX5zigxAaaN1XMU
         IKaoMTbTJh4NrRtz343X6HYGpAwP1u4qx2WxqESBZ1sjFP7vhl8vQ0r6XHQSoFCZY5hb
         cKxENCMAy1xe/0wF6Nxf7jxPU19Bgo2sOUTXDbOPjRZXJqTpV5650wH56BEaZ2bGd/Ci
         RmrASZsr4rBQQlMc23LPmjsSdN6mQnbw03bCIJaKt7NmD1GPeuznoLXsxSNngeCLbFT6
         PLF0i5ENACrHUiKbV7vTBOg6DgHQ9dTWmL9DSQ45pOG30TOgIefcXqhiNt2MR//WpYe3
         h6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787003511; x=1787608311;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJUnUoMS0efqPdEWh6VyFBSW/fIK2d8cOEcdE1MOroo=;
        b=PjL9iie484cO5qg5IWjHGQRl3MFXQMaJOnTYdcNhwgmIwT+CCRhLfy5eb2jmlOdHwf
         OqzTmo8NrDYxGnTPhPmgup+NHPWfuZKz5h+8g9EX4jnjGrBJegR7arOC1Ew0Ha4q27Ai
         75kWkRnpC1axd4KBnvcXPwM2uxeIWiqI4+NXo21X7efEQZW3X0llHPCgM0k2GfoOOmK5
         e3SH4n/9Wwqb1Q97D5Of59UgGE4zUIW9YoXjGbxBQqXLm/cA9Wu42un1D8eEQiNUHF77
         NaUfGhj+J4vCvqYMY9MxFzf1oEkjawvmtUBYQsDFW9ifwLf5AsW4F5LvsXgO8ISgZ7/0
         35Jw==
X-Forwarded-Encrypted: i=1; AHgh+RplHlxLiIbqmK2HnZG1YGNyce83AzQ6P3TE2bnXvpZBHD3i4Jd077XvrefBUZNNskGOdlug/02LRnaj1A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0dFfG4/yuNWjXztXm2amxGBYdUChy35UAzGkJO2BGgX1H/zss
	L8HpS/DwfnL31x6JA8tYI6oMMPhWYFf9Su8ec7wwdCOtHtMqcC462cmv
X-Gm-Gg: AR+sD107/eDENavX+75IYaPnQEtFC/ra5Ilu5v+wXXaXo2lXRbKgx/jbTajJYhinszo
	d0MihgEc//ACG0QZDCBJr0V6Ytj/hhWG0CK95CENMGsm4DdcNctLeRpoapkuMPZUMuORDEUhUyy
	HwCSl9TPGg+0toPk0Kkz611QtrEz7gK3E+UFwpqdZy0z7MuFTEDLLOP4481irBue0q74BJ47HBI
	WQwhnMqElFJkDo+a9ak1O1tpSvj75kGcRzOwZn91a/9jsEB6unDUBOpMPv5NLcpWPLcIJlHQa/G
	YkSglpMxxAmoCH69CofNtVa+Bi2TkE0GZNmyLRKSCOKMoEfzKRzP2CO8ALtgAXw94KiWGjh8Xa6
	T/sJm5aKjSWO2qa8HDtb/onzO/CK1m6PFJBEo2mNM7BO77C7vIhaTXyywSFiFwsvPeW5sg1PYFV
	0fjgEr8H896FI58NScsdFjwgBxK4w/H2cYyuZKkUE+CQ0QzBU4FWyiPKgqyGqpKBme29tJYYJJs
	YQKDaoxCJeNysOsNf6GOviQikkp8rJbWqe3bXwuv/OubwCz2TGJq00=
X-Received: by 2002:a05:6000:4201:b0:47f:e760:e5b9 with SMTP id ffacd0b85a97d-482a903c1c1mr4995812f8f.18.1787003511415;
        Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
Received: from localhost (178.43.142.119.ipv4.supernova.orange.pl. [178.43.142.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b51asm6988840f8f.11.2026.08.17.14.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:51:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Aug 2026 23:40:26 +0200
Message-Id: <DKRJMT8IZSXS.2GKM3OUHXHTK7@gmail.com>
Subject: Re: [PATCH v15 18/22] media: i2c: maxim-serdes: add MAX9296A driver
From: "Artur Andrzejczak" <andrzejczak.artur@gmail.com>
To: "Dumitru Ceclan" <dumitru.ceclan@analog.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Sakari Ailus" <sakari.ailus@linux.intel.com>,
 "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>, "Julien Massot"
 <julien.massot@collabora.com>, "Rob Herring" <robh@kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
Cc: <mitrutzceclan@gmail.com>, <linux-media@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, <linux-gpio@vger.kernel.org>,
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
 "Martin Hecht" <Martin.Hecht@avnet.eu>, "Andrian Suciu"
 <Adrian.Suciu@analog.com>, "Cosmin Tanislav" <demonsingur@gmail.com>
X-Mailer: aerc 0.21.0
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <20260807-gmsl2-3_serdes-v15-18-7212e9e5156a@analog.com>
In-Reply-To: <20260807-gmsl2-3_serdes-v15-18-7212e9e5156a@analog.com>

On Fri Aug 7, 2026 at 3:02 PM CEST, Dumitru Ceclan wrote:
> [...]

max9296a_set_tpg_clk() writes MAX9296A_VPRBS(0). The comment states TPG
data always lands on pipe 0, but don't pipe_hw_ids start at 1 on
MAX96714/96714F/96716A/96792A, with hw pipe 0 never mapped?
max9626a_log_pipe_status() already reads VPRBS through
max9296a_pipe_id(). Should this write use the accessor too? Also, is the
"max9626a" in that function name a typo? The file header and
MODULE_DESCRIPTION say "Quad GMSL2 Deserializer", but isn't this a
dual-link chip?

As in patch 17: could the 200 ms sleep in max9296a_select_links() poll
link lock status instead?

max9296a_init_phy() enables D-PHY deskew when dpll_freq > 1.5 GHz
without checking for C-PHY (max96724.c gates this on !is_cphy). This
might affect MAX96716A/96792A.

Kind Regards,
Artur Andrzejczak
