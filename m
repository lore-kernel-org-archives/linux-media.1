Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C0D477992
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301035; cv=none; b=eIGEVmDRc3xeG6fNOAamRufCHuKdnxDxC0K/y+KqjOxGtQN4dyGyWVb8sdZXl5FoNbGN1hnSOYpw7X6HL5fkSu+SMLKclT7s3inwKzkKm+RFV/10jk57SBojgvr7u2Iys8i+z4+cvK6c9H94jm3Kw1yvNa83z+V27ZvK3dGhMRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301035; c=relaxed/simple;
	bh=RuI8+EqlGrOMRBOkWSLAETNaak+37y0pyYEL7j3+dIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSg86sHPgRT8RCTFl0dnI1lP9f1W7lL04QoIvEGSisBGv8LfWc3PJzjZcxxy7XvKaRDE6xPdTw+1RDsMod3adDHMdX3mbZ9nz68IWwku+Zpk/IvEPs3FXQ6m+7CJiZf5eGAR+FvBItS8f3bly3K1DcgvWJ4UH4TTA5x9sKkCEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jv0w+tzL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jv0w+tzL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40F81F00A3A
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 22:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788301034;
	bh=RuI8+EqlGrOMRBOkWSLAETNaak+37y0pyYEL7j3+dIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jv0w+tzL/+x9oYplf3ZRyy5RQHE2kOmLks3S7m1hk4T1JBlV8uBJ5Lf0u0rL0P0bu
	 z4t7k42mwGe5KBe1KXtve9RVU/kCK7TfLln6HFtgh2m+96gFydsB1FRP1MpuGxYMBj
	 Ad7V6sKHeeBxx3mj5iaUZ/rcsjdOV2Q6LS/qxfO+KEGgPUwDVWZSH1/KmuszYcdTI6
	 sk04iWmCpLe0qq1j47n1XwQPuNrJP6gmKkknGdDPZyFEaz4c8cJyhxSZ47eEZD1r3e
	 ybB34h4E513KmbvkScgHqfFZOb3jWwDtVy/xslAL6Wb9LTBTgMEarDuqWxpux/S8Bu
	 rrfqe/mIKQhkw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b4a9994c20so312591e87.0
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 15:17:14 -0700 (PDT)
X-Gm-Message-State: AFuF++msbGu1LqKXhmAAFRU1k+ZvhZWh/d3ESh6zAmuBJYhnLGQwkQE/
	GTPqCJeAJqGJjObnCwlXGQCtMUNLzEtQe06s7BAs3tK6ZPYWHi8hf5bDs6KvNtYAkWziLW/CO/J
	VSEwPuNerxlggc8+Uw+M1yk7oGHSMIbI=
X-Received: by 2002:a05:6512:32c1:b0:5b0:137f:9476 with SMTP id
 2adb3069b0e04-5b6086808eemr195676e87.16.1788301033389; Tue, 01 Sep 2026
 15:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824121451.3348583-1-sakari.ailus@linux.intel.com> <20260824121451.3348583-15-sakari.ailus@linux.intel.com>
In-Reply-To: <20260824121451.3348583-15-sakari.ailus@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 2 Sep 2026 00:16:59 +0200
X-Gmail-Original-Message-ID: <CAD++jLnDd4BEMB0gt8AC2uHAKDeHY3qNAF7JHaWvBWw8LG9+RQ@mail.gmail.com>
X-Gm-Features: AcwNN1VX_QhnHCBnaoAiybHAwoVWgcnt_LhAC-tKr1vkhYFy6ZPDnVK4w0G_YVY
Message-ID: <CAD++jLnDd4BEMB0gt8AC2uHAKDeHY3qNAF7JHaWvBWw8LG9+RQ@mail.gmail.com>
Subject: Re: [PATCH v3 14/29] media: v4l2-subdev: Make v4l2_subdev_get_frame_desc_passthrough()
 static
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jai Luthra <jai.luthra@ideasonboard.com>, 
	Mehdi Djait <mehdi.djait@linux.intel.com>, Mattijs Korpershoek <mkorpershoek@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 2:14=E2=80=AFPM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:

> No driver uses (nor should use) v4l2_subdev_get_frame_desc_passthrough()
> anymore, make it static.
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

That's neat.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
