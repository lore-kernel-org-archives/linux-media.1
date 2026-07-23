Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3785641E6DF
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 12:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808387; cv=pass; b=kmXo/DAAY5NQoR+5bjiqmQMG3cYXkfnqUAFD+ery4Z2Q3VxE6k4AyLX3hzm9QX0AvLIvSOmVBNlJILtTa4edhv0Xbkf266EOORytt5BuVuGfZER8jQBFI2jfN0fvkBOpx0E4lbxTws5yQdGiJ4eRJoqLYhZ4mMtUW0AVk0KJ4r4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808387; c=relaxed/simple;
	bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyQYhdajBBscxUlYFnJe9Z+A9LiK3iYoTcnfh/deGhgR7ugDo4sMiR5eh497csC9bC2Z5OnnQRHev4W1PzN+Jyr3jeGBZDWtEd+pyGRLPuQPenHoj3U43W5QkwAsG0oejoqzD4glEIaiUiULw5kDpUG7X4usppk10A6Uyot1Xhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MmsDj+Wm; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MmsDj+Wm"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cf110997efso1711525ad.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 05:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784808385; cv=none;
        d=google.com; s=arc-20260327;
        b=GLHJkP0E5Y23hQkCd5Ka6lF6C4i12dPJgIlJvbR6AOu/9/BXK/LL25Tu5Q3hRfDVsJ
         7xgBjA4zP7Toagv6sSK0vdTTn24xyuVuu7a/s3VDNQP5k0b42qkYfvHjQpAb8BA6JqLY
         6MwBdjjBWkg68Ar0sjB+azzGlRF/DFZpcsvnleTC2ICVJlCZPGI58uXkrpHEgej+Va4R
         WRTtJQ+k52bkuzoM2mRGOWA67ww2qso1eY6EUQG5WIT5QT4HVJGRqjrfszbb0YRy3FbC
         /oKDKFrbPLBa3tQbGVkLB6R2dAjz94dzvkKAT6OA0KF7Ri0z5gLQqSvvQU62BU2Fds65
         FKOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
        fh=3Jqat9ZoqiA+ard8CrXVlS2T+MvPvhYv0HbetEP2S10=;
        b=QvAbDZWDSE4MvLTwMIcd7bFG3G6aODW3ex+r327NJ7j6AiFu48N0TmzDVCIKvVz3+E
         0zEK9jAhs6WvDylwdkKl2IIEX+6wK1mrvfUJiw0RHqBeelp5O5t+FPSobcSHvV+Ao+gf
         Z24JAWRpb5xGf+4Hks9VzSVJjOuvINxM4q5aA1UrGW+YwLmVz5eF6VhpkmYJHfTRFmWp
         vCdDQZFSxvzHHrx00CuudBoS/y3HHj+2brga+HXXcBuoyYmxUn4G2XRwlc+kEvNrHI76
         Nw1eyKhWlIKQ0wRNd7cN3LwiiFupOAkBKScGqoMCZ0+RZL6K2VrIHqSuYtLUTAPHl+mT
         UrCQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784808385; x=1785413185; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
        b=MmsDj+WmZJ3amnl9ppOKjrpkUBqFCzk40LcVmzfyH83ZlgPaULSqdIK15a5qHha0vv
         Y0cJ7hIVWICgxK3zyU/UavxLEd3WruPxfo+krEryrN5F8OEq1NcDc7js1SHPJvMoGUcS
         c1UA5pZqZZM6CshwOsShnIKJDtAgoGxzz1r5LYuYJjaD4f1hOt+fnII46X0SBjVvYcYg
         g6RuTvW8pwiz2xlugEMlznC+u+VtDkBsqyjgc+ovKHrTMqhHqd2rVMiVTW3hE86QU3U/
         20cEZZ+ekMHHe77vqhSUT9aSarrpKJyUYgXxTQVlO13gYyw5I2zRTmWOYmjGLISWkqbn
         V0gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808385; x=1785413185;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vlJv6FSf1aMVbnSCASc4/+DJaUBunDB2IB1X7BaEeM=;
        b=LcTJYv+AN+2MMlcMVjMj5ESSUsvvVDisNmDwyNcGsJwrfuNNni7m2SZ2l74hSiR4yV
         57Q1C4RxeOvUf9LB2FyOyhazooDJSqsfgGtaPJFYOdLG4M5SUYtYRNCGETZizV82DhWy
         BHAWrJ60UuLQM9AnKGdReM6Ih08VVN6tilIe/jLdGA5Su6jzDelgxq1Ta93c3pkPrxWo
         J+FZfeyVsvlPoiHfU9l3V0RK3QRpBSwoDXnyqioKz2TgwviMGS9GNpq/s+O5TuvQoRFU
         fk+en+OgjVnytzw5OTdgJjTgNfTi4fOC1UGk7JRS+5JTnBODAhqBGA6qBwZOsR/TABy3
         c2pw==
X-Forwarded-Encrypted: i=1; AHgh+RomHjEpdiCpF1xPTe72Gim+kVln3gxujD78RcqqN+XL2w3+dfXADpTvGUY2qgYAxyYGudOGoUufWcls6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYT/uU7e18tg02CK9wlAbUEUP+/S+4O2fUtXG6R5xGffEWMuqW
	HBAZkpyq/TUFOZvKhBEAp7Hi6YeS/x6ZexYWYKZ8c+TWW1PZ8JPLftsL1pq8axvc9qWiJ9ha71n
	WkvADs21Zqcxtxca+ENsKpAvnSrX442g=
X-Gm-Gg: AR+sD11nJvzXdOM8YjFdk9uePk0OhEQ9dP8o7wzWY2ZBpRAPMgdtKiilqt57xnJMWDE
	/72bqxKHfvg5jIliEa+sZuAD8lGGdvhmpLwKUUOkS3czr8dpJGcv5WOlSTHWwX3qbvvm+XHOHdn
	82VG8LI2xmo5H9BX+Js3SJyF4PKDQoPJ6JvlKTLzRI110z4cwtICp0AZKuzq729lU2rUMlAqqVe
	GYJXeI7q2DE+HBiQUPzJdjn0AXhnreEwzwaaK9Okwf0qMFYPFpu5mUcOjlVdLDL6M00iFWm8tDz
	6lpvWThZ9U1sKpqB3BUUfOakgoa1cUKtWFXN3TK0/s0+SwSA3dSy0ODKE1xAxEoVmgFujxITOXz
	mn2PG8qsjyEGt
X-Received: by 2002:a17:903:4b2d:b0:2cc:e3b6:f305 with SMTP id
 d9443c01a7336-2cfa6c59d68mr27112065ad.4.1784808385545; Thu, 23 Jul 2026
 05:06:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722144931.1070312-2-phasta@kernel.org> <20260722144931.1070312-4-phasta@kernel.org>
 <fdcff2949180fa40d0605866fcb306781ddae4cf.camel@nvidia.com> <73981717a8a609013eaca197a41a741c52bff44d.camel@mailbox.org>
In-Reply-To: <73981717a8a609013eaca197a41a741c52bff44d.camel@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 23 Jul 2026 14:06:12 +0200
X-Gm-Features: AUfX_mxFlBb9IDtLvxq2VlENXeNPc_YmNc4BAainSjkN3awVvg2ldaZORrjacic
Message-ID: <CANiq72=zQkkQWedVZ-rtCeJBbRxhwNJTLxCBD-6um4OMuFJGGQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] rust: error: Add ECANCELED error code
To: phasta@kernel.org
Cc: Timur Tabi <ttabi@nvidia.com>, "qiang.zhang@linux.dev" <qiang.zhang@linux.dev>, 
	"josh@joshtriplett.org" <josh@joshtriplett.org>, Joel Fernandes <joelagnelf@nvidia.com>, 
	"delcastillodelarosadaniel@gmail.com" <delcastillodelarosadaniel@gmail.com>, 
	"a.hindborg@kernel.org" <a.hindborg@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, "adzicmirko97@gmail.com" <adzicmirko97@gmail.com>, 
	"alistair.francis@wdc.com" <alistair.francis@wdc.com>, "ojeda@kernel.org" <ojeda@kernel.org>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, "yury.norov@gmail.com" <yury.norov@gmail.com>, 
	"tmgross@umich.edu" <tmgross@umich.edu>, "frederic@kernel.org" <frederic@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, 
	"daniel.almeida@collabora.com" <daniel.almeida@collabora.com>, "boqun@kernel.org" <boqun@kernel.org>, 
	"lossin@kernel.org" <lossin@kernel.org>, "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>, 
	"neeraj.upadhyay@kernel.org" <neeraj.upadhyay@kernel.org>, "paulmck@kernel.org" <paulmck@kernel.org>, 
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"tamird@kernel.org" <tamird@kernel.org>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "lyude@redhat.com" <lyude@redhat.com>, 
	"lina+kernel@asahilina.net" <lina+kernel@asahilina.net>, "ljs@kernel.org" <ljs@kernel.org>, 
	"mathieu.desnoyers@efficios.com" <mathieu.desnoyers@efficios.com>, "work@onurozkan.dev" <work@onurozkan.dev>, 
	"urezki@gmail.com" <urezki@gmail.com>, "gary@garyguo.net" <gary@garyguo.net>, 
	"jiangshanlai@gmail.com" <jiangshanlai@gmail.com>, 
	"fujita.tomonori@gmail.com" <fujita.tomonori@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"rcu@vger.kernel.org" <rcu@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 1:56=E2=80=AFPM Philipp Stanner <phasta@mailbox.org=
> wrote:
>
> Ok, pulled it in my local branch for now, thx for the heads-up.
>
> I see that your patch is from June. If it lands in drm-rust-next
> soonish I'd simply rebase.

I will take Timur's this cycle, so it should be fine either way.

Cheers,
Miguel
