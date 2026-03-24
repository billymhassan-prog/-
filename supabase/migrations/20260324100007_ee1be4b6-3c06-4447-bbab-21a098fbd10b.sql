CREATE TABLE public.team_members (
  id UUID NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'ramping' CHECK (status IN ('ramped', 'ramping')),
  start_date DATE NOT NULL DEFAULT CURRENT_DATE,
  role TEXT DEFAULT 'AE',
  notes TEXT DEFAULT '',
  created_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now(),
  updated_at TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT now()
);

ALTER TABLE public.team_members ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Allow all access to team_members" ON public.team_members
  FOR ALL USING (true) WITH CHECK (true);