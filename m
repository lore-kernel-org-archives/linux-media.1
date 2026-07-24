Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8E237DEB5;
	Fri, 24 Jul 2026 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929666; cv=pass; b=UNNy9zTm01ek6ZqvBlxQzpjKohBYZ1Izi2SKX0Cbl5mt2s4RW61DT/XdVAM4Mf6guSZ7OCRoxQEgPSR7KslwNw9pdHiChi7zV6raScpqUPO3xuVn3Jv8n6XGHYTZVrPei5Ju21BaIGrBqXX73QwdwBihZ+lbWyQNDQ2k3ZQ+lWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929666; c=relaxed/simple;
	bh=fapiEJJg6iAeChaC2B+9amM7Ev0+F+zuc8Jx/Xfqg44=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dH8q4yB4LXPC2uLxhMH8aTHWdBCpQig7kdreV7IFpcbgwOcwPzBuH+7KX+2h66Bmq/c1IuE89fcHKrDV5BwePSLC1MyMCRiTKl5Jrk6prkYhgILEaxWVhccKgTjRlxhsaXC7E4rrhfIwlFTZmZCtusS+nzVbhCjrbd4lsUM1DwI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com; spf=pass smtp.mailfrom=ritovision.com; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=hLa+Icqz; arc=pass smtp.client-ip=136.143.188.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ritovision.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="hLa+Icqz"
ARC-Seal: i=1; a=rsa-sha256; t=1784929373; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FgYx03fegReL7Y8YYor6ZRY98EaMHGkRbVnoS/jnf73vZ7m4yIKRFD9I8MQLoAvmQb4xEynbv5g6H66mKZYgv7BZrW7/Jg86SXR+FbwCPOpPP5wZRCbu1UMkQpCsH3um8EunmTfy673o4i3K6JZd9HQL8xJm+zqw5Tg2egfSJQo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784929373; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pge7NpPGtik6AtXXKE5GVjl7BYuQkVXuskiakLhjFdE=; 
	b=VLYIGF2G7ZIhnFTq15yzJztqqY2n8SgWPfI7o/NqL9WKVsYr4DATWhG9DmJG/f+lF/bDVz9MlZjAl5n+v9bx6Sr4QeThn3CsP7g5gKWvrUUpBZzfwHXF6Zi1ii+L2h0c8bWzbd/DgnK7ASJ/0uDH1QfqcmXPw6hfMC79pIpIIWA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784929373;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pge7NpPGtik6AtXXKE5GVjl7BYuQkVXuskiakLhjFdE=;
	b=hLa+IcqzN/m/Tx5UAxTxNgudeP03vqA8dJKR41YhtZfMrTfvWsPVgUaELV99/JHZ
	C4Pa1X/TNCKtr6zhsrVMxiLzsyVtFb3fUq0eKccGCaI/izqk5t1azIhG0EshwRBoREH
	VcTYZ4L+Yvj1RE3Ux9tOSzHxTIlMh7cw/H50jsDw=
Received: by mx.zohomail.com with SMTPS id 1784929371747998.6433509478711;
	Fri, 24 Jul 2026 14:42:51 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Daniel Lundberg Pedersen <dlp@qtec.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH 0/2] docs: make tables responsive with content-aware column widths
Date: Fri, 24 Jul 2026 17:42:46 -0400
Message-ID: <20260724214249.23830-1-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This series establishes a responsive layout foundation for generated
tables throughout the documentation site. Wide tables can use contained
horizontal scrolling on narrow viewports instead of widening the page or
compressing their columns until the content becomes unreadable.

It also derives content-aware minimum widths for each column, giving
table content a reasonable floor before wrapping. This prevents
aggressive wrapping from collapsing a column's own text into nearly
vertical lines and prevents wider columns from squeezing neighboring
columns into the same unreadable state.

This addresses the current pathological failure modes in which tables
either widen the page beyond its margins or collapse columns into
nearly vertical text.

Integration note:

This series is intended to stack on top of Mauro's "docs: custom.css:
don't limit randering to old 800px monitors", retaining its 120em body
maximum.

Jon's revert of "docs: allow inline literals in paragraphs to wrap to
prevent overflow" should not be carried forward. Patch 2 retains
overflow-wrap: anywhere and prevents the unreadable table wrapping that
motivated the revert by adding content-derived column minimums.

Rito Rhymes (2):
  docs: apply contained horizontal scroll overflow to tables
  docs: derive table column minimum widths from content

 Documentation/conf.py                  |   1 +
 Documentation/sphinx-static/custom.css | 198 ++++++++++++++++++++++++-
 Documentation/sphinx/table_layout.py   | 136 +++++++++++++++++
 3 files changed, 334 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/sphinx/table_layout.py


base-commit: a635d6748234582ea287c5ffeae28b9b23f91c7e
-- 
2.51.0
